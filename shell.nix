let 
pkgs = import <nixpkgs> {};
in
with pkgs;
mkShell rec {
  buildInputs = with pkgs; [
    xorg.libXScrnSaver
    xorg.libX11
    # Dev dependencies
    jetbrains.idea-community
    rustup
    llvmPackages_11.clang
    llvmPackages_11.llvm
    llvmPackages_11.libcxxClang
    llvmPackages_11.libcxxStdenv
    llvmPackages_11.libclang
    pkg-config
  ];
  LIBCLANG_PATH = pkgs.lib.makeLibraryPath (with pkgs; [ 
    llvmPackages_11.libclang
  ]);
  LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
  RUST_BACKTRACE = 1;
}
