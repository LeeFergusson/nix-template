{
  description = "DevShell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default =
          with pkgs;
          mkShell rec {
            buildInputs = [
              pkg-config
              # Project dependencies
              # ...
            ];

            LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${toString (pkgs.lib.makeLibraryPath buildInputs)}";
          };
      }
    );
}
