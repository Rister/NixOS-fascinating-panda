{ config, lib, pkgs, ... }:

{
  users.users = {
    rister = {
      createHome = true;
      extraGroups = [ "wheel" ];
      group = "users";
      home = "/home/rister";
      isNormalUser = true;
    };
  };
}
