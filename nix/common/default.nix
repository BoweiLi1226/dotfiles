{ pkgs, inputs, ... }:

{
  nix.package = pkgs.lix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set the Git commit hash for this system configuration.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [];

  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
  ];
}
