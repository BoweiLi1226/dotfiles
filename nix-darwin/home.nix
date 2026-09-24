{ ... }:

{
  xdg.configFile."nvim".source =
    ../nvim/.config/nvim;

  xdg.configFile."ghostty".source =
    ../ghostty/.config/ghostty;

  home.file.".zshrc".source =
    ../zsh/.zshrc;

  home.file.".zshenv".source =
    ../zsh/.zshenv;

  home.file.".zsh_plugins.txt".source =
    ../zsh/.zsh_plugins.txt;

  home.stateVersion = "26.05";
}
