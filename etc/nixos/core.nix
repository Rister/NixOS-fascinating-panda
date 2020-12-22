{ config, lib, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    git
    htop
    tmux
    vim
    wget
    curl
    unzip
    which
    whois
    w3m
    man-pages
    bash

  ];

}
