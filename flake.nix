{
  description = "Script to display large files in a directory";

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "lsbig";
        src = ./.;
        nativeBuildInputs = with pkgs; [
          makeWrapper
          installShellFiles
          scdoc
        ];
        installPhase = ''
          installBin lsbig
          scdoc < lsbig.1.scd > lsbig.1
          installManPage lsbig.1
          wrapProgram $out/bin/lsbig --prefix PATH : ${pkgs.lib.makeBinPath (with pkgs; [
            coreutils
            gawk
          ])}
        '';
      };
    });
}
