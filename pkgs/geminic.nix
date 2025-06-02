{ lib, buildGoModule, fetchFromGitHub, }:
buildGoModule rec {
  pname = "geminic";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "Beriholic";
    repo = "geminic";
    tag = "${version}";
    hash = "sha256-q0aLRSQY0oDGCpDPPO4L+Kgzzo9Pr/zZZgyYijkvFKg=";
  };

  vendorHash = "sha256-77h2H/mhw9YkAMasVMxoadJbmjmxUPLf/k6tM+cOZcs=";

  meta = {
    description = "Using Gemini to Write Git Commits";
    homepage = "https://github.com/Beriholic/geminic";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ Beriholic ];
  };
}
