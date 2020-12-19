{ config, lib, pkgs, ... }:

{
  users.extraUsers = {
    rister = {
      createHome = true;
      extraGroups = [ "wheel" ];
      group = "users";
      home = "/home/rister";
      isNormalUser = true;
    };
  };
}
