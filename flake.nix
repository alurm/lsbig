{
  description = "Script to display large files in a directory";

  outputs = {nixpkgs, flake-utils, ...}: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.default = pkgs.writeShellApplication {
      name = "lsbig";
      runtimeInputs = with pkgs; [
        # For test, printf, du, sort.
        coreutils
        # For awk.
        gawk
      ];
      text = builtins.readFile ./lsbig;
    };
  });
}
