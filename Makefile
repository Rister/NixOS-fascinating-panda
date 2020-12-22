##
# Fascinating Panda
# NixOS Configuration
#
# @file
# @version 0.1

install: tidy

tidy:
	nixfmt ./etc/nixos/configuration.nix

# end
