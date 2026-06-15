final: prev: {
  sing-box = prev.sing-box.overrideAttrs (oldAttrs: rec {
    version = "1.13.12";
    src = prev.fetchFromGitHub {
      owner = "SagerNet";
      repo = "sing-box";
      tag = "v${version}";
      hash = "sha256-AGv/0zUYWD32mQMkdiltWjMzHjfiAGIC1QDqZpK5sCw=";
    };
  });
}
