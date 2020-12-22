{ config, lib, pkgs, ... }:

{

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

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
