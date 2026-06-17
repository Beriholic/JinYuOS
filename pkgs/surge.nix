{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule (finalAttrs: {
  pname = "surge";
  version = "0.9.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "SurgeDM";
    repo = "Surge";
    tag = "v${finalAttrs.version}";
    hash = "sha256-yn6FJCraTCkk5x37ObZYSBaUEWqtj+kdQ1+arJMPCx8=";
  };

  vendorHash = "sha256-5z4qZnbYEYhJ8mm/kBxhMDaVLxWfo/UKiXhtdoJTSZM=";

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
