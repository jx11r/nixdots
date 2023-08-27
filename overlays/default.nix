{ inputs, ... }:

{
  additions = final: prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    python3 = prev.python3.override {
      packageOverrides = self: super: {
        cairocffi = super.cairocffi.overridePythonAttrs rec {
          pname = "cairocffi";
          version = "1.6.1";
          postPatch = "";
          src = prev.fetchPypi {
            inherit pname version;
            sha256 = "78e6bbe47357640c453d0be929fa49cd05cce2e1286f3d2a1ca9cbda7efdb8b7";
          };
          propagatedNativeBuildInputs = with prev.python3Packages; [ cffi flit-core ];
        };

        xcffib = super.xcffib.overridePythonAttrs rec {
          pname = "xcffib";
          version = "1.5.0";
          patches = [ ];
          src = prev.fetchPypi {
            inherit pname version;
            sha256 = "a95c9465f2f97b4fcede606bd1e08407a32df71cb760fd57bfe53677db691acc";
          };
        };

        qtile = super.qtile.overridePythonAttrs {
          version = "2023.08.23";
          src = prev.fetchFromGitHub {
            owner = "qtile";
            repo = "qtile";
            rev = "9b2aff3b3d4607f3e782afda2ec2a061d7eba9f1";
            sha256 = "00x8h4jkjc0q4j50bja09gjrqkmlqkkzbpk2riwd32inxbshwhyv";
          };
          buildInputs = with prev; [
            libinput
            libxkbcommon
          ];
          propagatedBuildInputs = (with prev.python3Packages; [
            dbus-next
            dbus-python
            mpd2
            psutil
            pygobject3
            python-dateutil
            pyxdg
            xkbcommon
          ]) ++ (with self; [
            cairocffi
            xcffib
          ]) ++ [ prev.pulseaudio ];
        };

        qtile-extras = super.qtile-extras.overridePythonAttrs {
          version = "2023.08.13";
          doCheck = false;
          src = prev.fetchFromGitHub {
            owner = "elParaguayo";
            repo = "qtile-extras";
            rev = "ed01fd8b94997b2a87eecb9bf48e424be91baf76";
            sha256 = "0jxxk3d75cvr9zbpflk7qmhnyqsrkyzsyqpnzq9wkyncihadm1x4";
          };
        };
      };
    };
  };
}
