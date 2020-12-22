{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
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
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sda";
      };

    };

  };

  networking = {
    domain = "";
    hostName = "NIXBALL48";
    wireless.enable = true;

    # The global useDHCP flag is deprecated use per-interface instead
    useDHCP = false;
    interfaces.enp0s3.useDHCP = true;

    firewall = {

    };

  };

  services = {

    openssh.enable = true;
    locate.enable = true;

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

  system.stateVersion = "20.09";

}
