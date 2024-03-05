{
  pkgs,
  ...
}: 
let
  font = "JetBrainsMono Nerd Font";
in
{
 programs.alacritty = {
  enable = true;
  settings = {
   window.opacity = 0.95;
   window.dynamic_padding = true;
   scrolling.history = 10000;

   font = {
     normal.family = font;
     bold.family = font;
     italic.family = font;
     size = 11;
    };

   };
 };
}
