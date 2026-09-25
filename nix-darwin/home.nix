{ pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

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
    ../nvim/.config/nvim;

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

  xdg.configFile."ghostty".source =
    ../ghostty/.config/ghostty;

  home.stateVersion = "26.05";
}
