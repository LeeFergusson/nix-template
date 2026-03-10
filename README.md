# ❄️ Nix Flake - Rust(Nightly) Template

A simple template for quickly creating projects using nix flakes.

These templates do not provide any project structure, they simply provide the tools and librarys needed to get you up and coding.

## General Usage

1) Clone the repository with a new name.
    ```sh
    $ git clone https://github.com/LeeFergusson/nix-template.git my-project
    $ cd my-project
    ```

2) Optionally switch to you'r desired branch.
    ```sh
    $ git switch rust-nightly
    ```
3) Enter develpment mode.
    ```sh
    # Manually
    $ nix develop
    
    # OR using direnv to load the flake whenever you entry the directory
    $ direnv allow
    ```
    This should generate an inital `flake.lock` for you project and drop you into a nix shell.

4) Tidy up the git history and add inital commit.
    ```sh
    $ rm -rf .git
    $ git init

    $ git add -A
    $ git commit -m "chore: Initial commit"
    ```
