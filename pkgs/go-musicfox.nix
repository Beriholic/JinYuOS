{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "go-musicfox";
  version = "4.8.5";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "go-musicfox";
    repo = "go-musicfox";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fgzj1L/oIVMCfiWaB83e9GEMyn6lfFSzF/hqq+i+5I0=";
  };
  vendorHash = null;

  # The avcore package's TestMain calls NSApplication.Run(), which needs a
  # live WindowServer. Nix's darwin sandbox can't provide one, so go test
  # traps with SIGTRAP under cgo. Skipping checkPhase is the standard fix
  # for GUI-bound Go test suites on Darwin.
  doCheck = false;

  # The ./cmd subPackage compiles to "bin/cmd" (package main in directory cmd);
  # rename to match meta.mainProgram so the binary is callable as `musicfox`.
  postInstall = ''
    mv $out/bin/cmd $out/bin/musicfox
  '';
  ldflags = [
    "-s"
    "-w"
    "-X=github.com/go-musicfox/go-musicfox/internal/types.AppVersion=${finalAttrs.src.rev}"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Go-musicfox是用Go写的又一款网易云音乐命令行客户端，支持UnblockNeteaseMusic、各种音质级别、lastfm、MPRIS、MacOS交互响应（睡眠暂停、蓝牙耳机连接断开响应、菜单栏控制等";
    homepage = "https://github.com/go-musicfox/go-musicfox";
    changelog = "https://github.com/go-musicfox/go-musicfox/blob/${finalAttrs.src.rev}/changelog.yml";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ Beriholic ];
    mainProgram = "musicfox";
  };
})
