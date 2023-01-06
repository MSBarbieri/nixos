{pkgs, ...}: let
  linux_link = pkgs.writeShellScriptBin "linux-link" ''
    #!/bin/bash

    sudo mkdir /lib64
    cd /nix/store/
    ld_path=$(fd -t l ld-linux-x86-64.so.2 | awk 'NR==1 {print $1}')
    sudo ln -s /nix/store/$ld_path /lib64/
    exit 0
  '';

  clone_repos = pkgs.writeShellScriptBin "clone-repos" ''
    #!/bin/bash
    cd ~/
    mkdir -p ~/dev/repos/MSBarbieri
    mkdir -p ~/.config

    gh repo clone lunarvim/lunarvim nvim
    gh repo clone MSBarbieri/lvim lvim
    rm -f nvim/.luarc.json nvim/config.lua
    cd .config/lvim
    bash ./stow

    gh repo clone MSBarbieri/awesome ~/.config/awesome

    cd ~/dev/repos/MSBarbieri
    gh repo clone MSBarbieri/msbarbieri.github.io
    gh repo clone MSBarbieri/local-k8s
    gh repo clone MSBarbieri/Argocd-Application-Sets argocd
    gh repo clone MSBarbieri/wiki
    gh repo clone MSBarbieri/resume
    gh repo clone MSBarbieri/portfolio
    gh repo clone MSBarbieri/.password-store ~/.password-store
  '';
in [linux_link]
