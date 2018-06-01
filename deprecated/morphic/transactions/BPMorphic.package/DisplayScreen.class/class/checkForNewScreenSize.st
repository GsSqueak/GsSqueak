display box access
checkForNewScreenSize
  "Check whether the screen size has changed and if so take appropriate
	actions "

  (SessionTemps current at: #'Display') extent = DisplayScreen actualScreenSize
    ifFalse: [ (SessionTemps current at: #'Display') restore ]