{ pkgs, ... }:

{
  home.username = "boweili";
  home.homeDirectory = "/Users/boweili";

  programs.home-manager.enable = true;

  programs.ghostty = {
  enable = true;
  package = null; # Not supported on macOS

  settings = {
    theme = "Rose Pine";

    clipboard-read = "allow";
    clipboard-write = "allow";

    font-family = "FantasqueSansM Nerd Font Mono";
    font-size = 20.0;
    font-thicken = true;

    macos-option-as-alt = true;
    macos-titlebar-style = "tabs";
    macos-titlebar-proxy-icon = "hidden";

    window-padding-x = 8;
    window-padding-y = 8;
    window-save-state = "always";

    cursor-style-blink = false;
    cursor-style = "bar";

    shell-integration-features = "no-cursor";

    scrollback-limit = 10000;

    quit-after-last-window-closed = true;
   };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    fastSyntaxHighlighting.enable = true;
    historySubstringSearch = {
      enable = true;
      searchUpKey = "^[[A";
      searchDownKey = "^[[B";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [ "nerd-font-symbols" ];
    settings = {
      username = {
        show_always = true;
      };
    };
  };

  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.fd.enable = true;
  programs.ripgrep.enable = true;
  programs.lazygit.enable = true;
  programs.herdr.enable = true;

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd" "cd" ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f";
  };

  programs.uv = {
    enable = true;
    python = {
      prune = true;
      versions = [ "3.14" ];
      default = [ "3.14" ];
    };
    tool = {
      prune = true;
      packages = [
        "ruff"
        "basedpyright"
      ];
    };
  };

  programs.npm.enable = true;
  programs.go.enable = true;
  programs.texlive.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    sideloadInitLua = true;
  };

  xdg.configFile."nvim".source =
    ../../nvim/.config/nvim;

  home.packages = with pkgs; [
    procs

    typescript
    rustup
    cmake

    tree-sitter
    lua-language-server
    stylua
    marksman
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.stateVersion = "26.05";
}
