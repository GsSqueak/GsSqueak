world menu
putUpWorldMenuFromEscapeKey
  Preferences noviceMode
    ifFalse: [ self putUpWorldMenu: SessionTemps current at: #'ActiveEvent' ifAbsent: [ nil ] ]