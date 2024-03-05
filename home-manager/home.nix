{ config, pkgs, inputs, ... }:

{

 imports = [
   ./programs
  ];

  # Home Manager needs information about you and the paths it should manage.
  home.username = "doni";
  home.homeDirectory = "/home/doni";
  nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

   # command line
   neofetch
   ranger
    
   # archives
   zip
   xz
   unzip
   p7zip

   # utils 
   jq
   fzf
   ripgrep

   # misc
   file
   which
   tree
   gnused
   gnutar
   zstd
   gnupg

   
   # productivity
   glow # markdown previewer in terminal
   

   btop  # replacement of htop/nmon
   iotop # io monitoring
   iftop # network monitoring
   
   # system call monitoring
   strace # system call monitoring
   ltrace # library call monitoring
   lsof   # list open files


   # system tools
   sysstat
   lm_sensors # for `sensors` command
   ethtool 
   pciutils # lspci
   usbutils # lsusb 

   # Media 
   vlc
   obs-studio
   
  ];


 
  home.stateVersion = "23.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true; 

}
