{ pkgs, ... }:

let
  server= pkgs.writeShellScriptBin "server" (builtins.readFile ./server/server.sh);
in
{
  environment.systemPackages = with pkgs; [
    server
  ];
}
