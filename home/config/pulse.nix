{ }:

''
  # The default setting is for pulseaudio-ctl to NOT increase to volume level
  # above 100 % but Some users may wish exceed this level. If this describes
  # your use case, uncomment the UPPER_THRESHOLD variable below setting it to
  # the new upper threshold.
  #
  UPPER_THRESHOLD=100

  # Push output through libnotify. Set to any value to enable this feature
  # and note that you must have /usr/bin/notify-send to use this. On Arch
  # libnotify provides this. Other distros may not name it as such.
  #
  #NOTIFY=yes

  # Show a graphical progress-bar type visualization of the volume level in
  # libnotify. No setting or commented out will show a simply percentage but
  # a setting will convert the percentage to a progress-bar in libnotify.
  #
  #BARCHART=yes

  # Use KDE OSD notification. Set to any value to enable this feature.
  #KDE_OSD=yes
''
