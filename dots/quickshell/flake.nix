{
  description = "Qt dev flake, new to flakes this is prolly shit. Use `which qmlls` to get language server dir.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {};
    };
  in {
    packages.${system}.default = pkgs.callPackage ./package.nix {};
    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [];
      buildInputs = with pkgs; [
        kdePackages.qtdeclarative
        kdePackages.qt5compat
      ];
      shellHook = ''
        export QML_IMPORT_PATH=$PWD/src
      '';
    };
  };
}
