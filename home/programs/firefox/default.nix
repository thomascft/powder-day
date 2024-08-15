{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.default = {
      id = 0;
      name = "default";
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";
      
        "apz.overscroll.enabled" = true;
        "general.smoothScroll" = true;
        "mousewheel.default.delta_multiplier_y" = 250; # 250-400
        "general.smoothScroll.msdPhysics.enabled" = false;
      };
      extraConfig = builtins.readFile (builtins.fetchurl {
        url = "https://github.com/yokoffing/Betterfox/raw/main/user.js";
        sha256 = "sha256:1iawzswj3lmnw3j5j07mknz928xhrk2hmc1y8jqzcqir9nn1nc40";
      });
      userChrome = builtins.readFile (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/migueravila/SimpleFox/master/chrome/userChrome.css";
        sha256 = "sha256:0jqv1fc1h1a2whgxa8rrq58znfaplrwhpkh5vrcja6hwbix1j1dh";
      });
      search = {
        force = true; # Stops FireFox from overwriting search order
        default = "Google";
        order = ["Google"];
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
        };
      };
    };
  };
}
