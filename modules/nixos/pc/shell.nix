{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = with pkgs; [
      python3Packages.tkinter
      python3
      tk
    ];
}
