{ pkgs ? import <nixpkgs> { } }:

let
  myEmacs = (pkgs.emacs.override {
    withGTK3 = true;
    withGTK2 = false;
  }).overrideAttrs (attrs: {
    postInstall = (attrs.postInstall or "") + ''
      rm $out/share/applications/emacs.desktop
    '';
  });
  emacsWithPackages = (pkgs.emacsPackagesGen myEmacs).emacsWithPackages;

in emacsWithPackages (epkgs:
  (with epkgs.melpaStablePackages; [ magit ])
  ++ (with epkgs.melpaPackages; [ doom-modeline nix-mode ])
  ++ (with epkgs.elpaPackages; [ auctex ]) ++ [ pkgs.notmuch ])
