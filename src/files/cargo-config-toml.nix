pkgs: {
  text = ''
    [target.aarch64-apple-darwin]
    rustflags = [
        "-C", "link-arg=-undefined",
        "-C", "link-arg=dynamic_lookup",
        "-L${pkgs.libiconv}/lib",
    ]
    '';
}
