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

    loader = {

    };

  };

  networking = {
    domain = "";
    hostName = "NIXBALL48";
    wireless.enable = true;
    useDHCP = true;
    firewall = {

    };

  };

  services = {

    openssh.enable = true;
    locate.enable = true;

    xserver = {

      enable = true;

      layout = "us";
      libinput.enable = true;

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

    };

    upower.enable = true;

  };

  systemd.services.upower.enable = true;

  users.extraUsers = {
    rister = {
      createHome = true;
      extraGroups = [ "wheel" ];
      group = "users";
      home = "/home/rister";
      isNormalUser = true;
    };

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
    which
    nix-repl
    dmenu
  ];

}
