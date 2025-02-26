{
  description = "Wallpapers flake";

  inputs = {};

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
