{
  description = "Rust(Nightly) DevShell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      rust-overlay,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        devShells.default =
          with pkgs;
          mkShell rec {
            buildInputs = [
              pkg-config
              # Rust dependencies
              (rust-bin.nightly.latest.default.override {
                extensions = [
                  "rust-src"
                  "rust-analyzer"
                  "clippy"
                ];
              })
              # Project dependencies
              # ...
            ];

            LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${toString (pkgs.lib.makeLibraryPath buildInputs)}";
            RUST_SRC_PATH = "${rustPlatform.rustLibSrc}";
          };
      }
    );
}
