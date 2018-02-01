display box access
checkForNewScreenSize
<<<<<<< HEAD
	"Check whether the screen size has changed and if so take appropriate
	actions "
	Display extent = DisplayScreen actualScreenSize
		ifFalse: [Display restore]
=======
  "Check whether the screen size has changed and if so take appropriate
	actions "

  (Smalltalk at: #'Display') extent = DisplayScreen actualScreenSize
    ifFalse: [ Display restore ]
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
