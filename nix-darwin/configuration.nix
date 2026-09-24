{ pkgs, inputs, ... }: 
{
  nix.package = pkgs.lix;

  users.users.boweili = {
    name = "boweili";
    home = "/Users/boweili";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat
    eza
    btop
    lazygit
    stow
    fd
    fzf
    ripgrep
    zoxide
    herdr

    uv
    cmake
    go
    python3
    nodejs

    neovim
    tree-sitter
    lua-language-server
    stylua
    marksman
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
