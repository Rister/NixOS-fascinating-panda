{ config, pkgs, ... }:

{

  imports = [
    # ./hardware-configuration.nix
    # Users
    ./users.nix
    ./core.nix
    # Window Manager
    ./wm/xmonad.nix
  ];

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

    };

    emacs.enable = true;

  };

  environment.systemPackages = with pkgs; [
    bind
    sysstat
    nmap
    mplayer
    python
    gnupg
    gcc
    dmenu
    rofi
    picom
    zsh
    (import ./emacs.nix { inherit pkgs; })
  ];

  programs = {

    zsh.ohMyZsh = {
      enable = true;
      plugins = [ "git" "python" "man" ];
      theme = "agnoster";
      customPkgs = [ pkgs.nix-zsh-completions ];
    };

    plotinus.enable = true;

  };

}
