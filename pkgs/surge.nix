{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule (finalAttrs: {
  pname = "surge";
  version = "0.10.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "SurgeDM";
    repo = "Surge";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BKRufXVD0h2lNtSwFGGjjHgZLG4C9V0Pq2kCx1VTms0=";
  };

  vendorHash = "sha256-hcDaohgm5B4gn3U3BkFK7Q7kAONc8l/7eKz0y32ZtBY=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/SurgeDM/Surge/cmd.Version=${finalAttrs.version}"
    "-X=github.com/SurgeDM/Surge/cmd.Commit=${finalAttrs.src.rev}"
  ];

  # Nix build sandboxes set HOME=/homeless-shelter (read-only). The
  # TestDynamicKeyMapReloading case in internal/tui calls config.EnsureDirs(),
  # which routes through xdg.StateHome — captured at package init from the
  # sandbox HOME, so EnsureDirs() tries `mkdir /homeless-shelter/...` and
  # fails with EROFS. XDG_STATE_HOME is read at call time by
  # config.getXDGBaseDir, so overriding it here bypasses the bad fallback.
  preCheck = ''
    export XDG_STATE_HOME="$TMPDIR"
    export HOME="$TMPDIR"
  '';

  meta = {
    description = "Blazing fast TUI download manager built in Go for power users";
    homepage = "https://github.com/SurgeDM/Surge";
    changelog = "https://github.com/SurgeDM/Surge/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ Beriholic ];
    mainProgram = "surge";
  };
})
