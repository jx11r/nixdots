final: prev:
let
  unwrapped = prev.qtile.passthru.unwrapped.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      # Custom patches here
    ];

    propagatedBuildInputs = (old.propagatedBuildInputs or [ ]) ++ (with final.python3Packages; [
      dbus-next
      # iwlib (missing module)
    ]);
  });
in
{
  qtile = (final.python3.withPackages (_: [ unwrapped ])).overrideAttrs
    (_: {
      name = "${unwrapped.pname}-${unwrapped.version}";
      passthru = { inherit unwrapped; };
    });
}
