{ pkgs, ... }:

let
  brewSrc = pkgs.fetchFromGitHub {
    owner = "Homebrew";
    repo = "brew";
    rev = "master"; # You can replace "master" with a specific commit if needed
    sha256 = "0a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e1f"; # Replace with the actual SHA256 hash
  };
in {
  home.packages = [
    (pkgs.buildFHSUserEnv {
      name = "homebrew";
      targetPkgs = pkgs: [
        (pkgs.runCommand "brew" { } ''
          mkdir -p $out
          cp -r ${brewSrc}/* $out/
        '')
      ];
    }).env
  ];

  # Optionally, add Homebrew to your PATH
  home.sessionVariables.PATH = "${pkgs.buildFHSUserEnv { name = "homebrew"; targetPkgs = pkgs: [ pkgs.bash ]; }}.env/bin:${pkgs.buildFHSUserEnv { name = "homebrew"; targetPkgs = pkgs: [ pkgs.bash ]; }}.env/sbin:${pkgs.buildFHSUserEnv { name = "homebrew"; targetPkgs = pkgs: [ pkgs.bash ]; }}.env/usr/bin:${pkgs.buildFHSUserEnv { name = "homebrew"; targetPkgs = pkgs: [ pkgs.bash ]; }}.env/usr/sbin:${pkgs.buildFHSUserEnv { name = "homebrew"; targetPkgs = pkgs: [ pkgs.bash ]; }}.env/usr/local/bin:${pkgs.buildFHSUserEnv { name = "homebrew"; targetPkgs = pkgs: [ pkgs.bash ]; }}.env/usr/local/sbin";
}
