{ config, pkgs, ... }:

{

  imports = [ ];

  system = {

    autoUpgrade = {
      channel = "https://nixos.org/channels/nixos-stable";
      enable = false;
    };

  };

  boot = {

  };

  networking = {

  };

  services = {

  };

  users.extraUsers = {

  };

  systemPackages = with pkgs; [
    wget
    curl
    bind
    sysstat
    htop
    tmux
    emacs
    vim
    nmap
    git
    mplayer
    python
    gnupg
    w3m
    gcc
  ];

}
