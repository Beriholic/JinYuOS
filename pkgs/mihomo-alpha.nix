{
  lib,
  fetchFromGitHub,
  buildGoModule,
  nixosTests,
}:

buildGoModule rec {
  pname = "mihomo-alpha";
  version = "alpha-71a8705";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "mihomo";
    rev = "71a87056367cd4fe461a4c9989aa46036d82c85c";
    hash = "sha256-QTjgYZ4Dw4ghQ2/NXUwx+L4zIzgnhu+CK4+VODqoR10=";
  };

  vendorHash = "sha256-2hLI8R6hwam7/n8JRQ9Xs4ycWwdNxGRvFM+JhH7ExgM=";

  excludedPackages = [ "./test" ];

  ldflags = [
    "-s"
    "-w"
    "-X github.com/metacubex/mihomo/constant.Version=${version}"
  ];

  tags = [ "with_gvisor" ];

  # network required
  doCheck = false;

  passthru.tests = {
    mihomo = nixosTests.mihomo;
  };

  meta = with lib; {
    description = "Rule-based tunnel in Go";
    homepage = "https://github.com/MetaCubeX/mihomo/tree/Alpha";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ oluceps ];
    mainProgram = "mihomo";
  };
}
