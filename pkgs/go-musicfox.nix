{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
  pkg-config,
  flac,
  stdenv,
  alsa-lib,
}:

buildGoModule (finalAttrs: {
  pname = "go-musicfox";
  version = "5.1.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "go-musicfox";
    repo = "go-musicfox";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gM3gnUbevPSa2gmiC0DGYPrVRtwHF2TQB0Hu99ISVU8=";
  };
  vendorHash = null;

  # goflac 和 oto/v3 通过 cgo 在构建时探测 libFLAC / ALSA（Linux 上走 pkg-config），
  # 缺了这些就会报 `exec: "pkg-config": executable file not found in $PATH`。
  # darwin 上 oto 直接用 AudioToolbox，不需要 alsa-lib。
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ flac ] ++ lib.optionals stdenv.hostPlatform.isLinux [ alsa-lib ];

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
