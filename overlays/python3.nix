final: prev:

{
  python3 = prev.python3.override {
    packageOverrides = self: super: {
      xcffib = super.xcffib.overridePythonAttrs rec {
        pname = "xcffib";
        version = "1.5.0";
        patches = [ ];
        src = prev.fetchPypi {
          inherit pname version;
          sha256 = "a95c9465f2f97b4fcede606bd1e08407a32df71cb760fd57bfe53677db691acc";
        };
      };

      qtile = super.qtile.overridePythonAttrs (oldAttrs: {
        version = "2023.08.29";

        src = prev.fetchFromGitHub {
          owner = "qtile";
          repo = "qtile";
          rev = "5711b5e7759c46a3c8a3fbf5e47ed767e91f3821";
          sha256 = "03m4dy41nppfv0cn8c62xfv8a09gn0pwh7whcc2m0haz5d7xzdqz";
        };

        buildInputs = with prev; [
          libinput
          libxkbcommon
        ];

        propagatedBuildInputs = (with prev.python3Packages; [
          cairocffi
          dbus-next
          dbus-python
          mpd2
          psutil
          pygobject3
          python-dateutil
          pyxdg
          xkbcommon
        ]) ++ [ self.xcffib ];

        patches = (oldAttrs.patches or [ ]) ++ [ ];
      });

      qtile-extras = super.qtile-extras.overridePythonAttrs (oldAttrs: {
        version = "2023.08.13";
        doCheck = false;

        src = prev.fetchFromGitHub {
          owner = "elParaguayo";
          repo = "qtile-extras";
          rev = "ed01fd8b94997b2a87eecb9bf48e424be91baf76";
          sha256 = "0jxxk3d75cvr9zbpflk7qmhnyqsrkyzsyqpnzq9wkyncihadm1x4";
        };

        patches = (oldAttrs.patches or [ ]) ++ [ ];
      });
    };
  };
}
