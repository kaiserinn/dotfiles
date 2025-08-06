{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    cargo
    libnotify
    wget
    brightnessctl
    pavucontrol
    networkmanagerapplet
    pamixer
    blueman
    unzip
    zip
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
