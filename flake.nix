{
  description = "Wallpapers flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = _: {
    overlays.default = _: prev: {
      wallpapers = prev.stdenvNoCC.mkDerivation {
        name = "Wallpapers";
        src = ./.;
        installPhase = ''
          mkdir -p $out
          cp -r ./src/* $out
        '';
      };
    };
  };
}
