{pkgs, ...}:
pkgs.mkShellNoCC {
  nativeBuildInputs = with pkgs; [
    # keep-sorted start
    alejandra
    commitlint
    deadnix
    keep-sorted
    lefthook
    nil
    statix
    taplo
    treefmt
    yamlfmt
    # keep-sorted end

    (mdformat.withPlugins (p:
      with p; [
        # keep-sorted start
        mdformat-gfm
        mdformat-gfm-alerts
        mdformat-tables
        # keep-sorted end
      ]))
  ];

  shellHook = ''
    lefthook install
  '';
}
