{
  description = "Wallpapers flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "09.04.2024";
      in
      with pkgs;
      {
        devShells.default = mkShell { buildInputs = [ ]; };
        packages = {
          default = stdenv.mkDerivation {
            name = "wallpapers";
            inherit version;
            src = ./.;
            buildPhase = ''
              mkdir -p $out
            '';
            installPhase = ''
              cp -rv $src/* $out
            '';
          };
          gruvbox = stdenv.mkDerivation {
            name = "gruvbox";
            inherit version;
            src = ./gruvbox;
            buildPhase = ''
              mkdir -p $out
            '';
            installPhase = ''
              cp -rv $src/* $out
            '';
          };
          solarized = stdenv.mkDerivation {
            name = "solarized";
            inherit version;
            src = ./solarized;
            buildPhase = ''
              mkdir -p $out
            '';
            installPhase = ''
              cp -rv $src/* $out
            '';
          };
        };
      }
    );
}
