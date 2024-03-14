{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "build-env";
  runScript = "zsh";
}).env
