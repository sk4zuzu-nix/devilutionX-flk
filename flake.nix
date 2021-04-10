{
  description = "A flake for devilutionX";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "devilutionX_sk4zuzu";
        version = "1.2.0";

        src = fetchFromGitHub {
          owner = "diasurgical";
          repo = "devilutionX";
          rev = version;
          sha256 = "sha256-P+X5q2a5iq+43FI73qbfdLGqJsiEwHqCWlbIo8CfnQw=";
        };

        cmakeFlags = ''
          -DASAN=OFF
          -DBINARY_RELEASE=ON
          -DDEBUG=OFF
          -DHELLFIRE=ON
          -DUBSAN=OFF
          -DVERSION_NUM=1.2.0
        '';

        nativeBuildInputs = [ cmake pkgconfig ];

        buildInputs = [
          libsodium
          SDL2 SDL2_mixer SDL2_ttf
        ];
      };
  };
}
