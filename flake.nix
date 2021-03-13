{
  description = "A flake for devilutionX";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "devilutionX_sk4zuzu";
        version = "da373f351d345b6fa2e08125bc7195fff17d2448";

        src = fetchFromGitHub {
          owner = "diasurgical";
          repo = "devilutionX";
          rev = version;
          sha256 = "sha256-iyQ0gmob9jcw/BGsUu8U4UHam8yyIK2aWTcMwUy1XjQ=";
        };

        cmakeFlags = ''
          -DASAN=OFF
          -DBINARY_RELEASE=ON
          -DDEBUG=OFF
          -DHELLFIRE=ON
          -DUBSAN=OFF
          -DVERSION_NUM=0.0.0
        '';

        nativeBuildInputs = [ cmake pkgconfig ];

        buildInputs = [
          libsodium
          SDL2 SDL2_mixer SDL2_ttf
        ];
      };
  };
}
