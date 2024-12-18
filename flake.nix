{
  description = "Wallpapers flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};

    wallpapers = pkgs.stdenv.mkDerivation {
      pname = "wallpapers";
      version = "1.0.0";
      src = ./.;
      installPhase = ''
        mkdir -p $out/share/wallpapers
        cp -r src/* $out/share/wallpapers
      '';
    };
  in {
    packages."${system}".default = wallpapers;
  };
}
