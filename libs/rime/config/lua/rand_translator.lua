-- 随机 Base64 字符串生成器
-- 输入触发关键字，输出对应长度的随机 Base64 编码字符串

local function yield_cand(seg, text)
    local cand = Candidate('', seg.start, seg._end, text, '')
    cand.quality = 100
    yield(cand)
end

-- librime 的 Lua 沙箱禁用了 os.execute/io.popen，因此无法直接调用 `openssl rand`。
-- 此实现使用 math.random（与 uuid.lua 一致），非密码学安全；如需 CSPRNG 请在外部生成。
-- 注意：不重复调用 randomseed，由 uuid.lua 在引擎启动时统一初始化 randomseed。
local function generate_b64(n)
    n = n or 32
    local alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    -- 计算输出字符数: 每个base64字符代表6位, 每字节8位, 所以需要 ceil(n * 8 / 6) = ceil(n * 4 / 3)
    local output_len = math.floor(n * 4 / 3)
    if n * 4 % 3 ~= 0 then output_len = output_len + 1 end
    -- 生成随机字符
    local result = {}
    for i = 1, output_len do
        local idx = math.random(0, 63)
        result[i] = string.sub(alphabet, idx + 1, idx + 1)
    end
    -- 填充 padding 使输出长度为4的倍数: 32字节 -> 44 chars -> 需要1个 '='
    local padding_len = (4 - output_len % 4) % 4
    for i = 1, padding_len do
        result[output_len + i] = '='
    end
    return table.concat(result)
end

local M = {}

function M.init(env)
    local config = env.engine.schema.config
    env.name_space = env.name_space:gsub('^*', '')
    M.rand = config:get_string(env.name_space .. '/rand') or 'rand'
    M.rand16 = config:get_string(env.name_space .. '/rand16') or 'rand16'
    M.rand64 = config:get_string(env.name_space .. '/rand64') or 'rand64'
    M.b32 = config:get_string(env.name_space .. '/b32') or 'b32'
end

function M.func(input, seg, env)
    -- rand → 32 bytes (~44 chars)
    if input == M.rand then
        yield_cand(seg, generate_b64(32))
    -- rand16 → 16 bytes (~24 chars)
    elseif input == M.rand16 then
        yield_cand(seg, generate_b64(16))
    -- rand64 → 64 bytes (~88 chars)
    elseif input == M.rand64 then
        yield_cand(seg, generate_b64(64))
    -- b32 → 32 bytes (别名，与 calc_translator 的 b32 行为一致)
    elseif input == M.b32 then
        yield_cand(seg, generate_b64(32))
    end
end

return M
