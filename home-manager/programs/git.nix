{
  pkgs,
  ...
}: { 
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "Allan Fernandes";
    userEmail = "allancravd@gmail.com";
  };
}
