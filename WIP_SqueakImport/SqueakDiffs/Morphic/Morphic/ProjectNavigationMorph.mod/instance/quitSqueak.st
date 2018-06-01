the actions
quitSqueak
	"Obtain a confirmation from the user, and if the answer is true, quite Squeak summarily"

	(self confirm: 'Are you sure you want to Quit Squeak?' translated) ifFalse: [^ self].
	
	Smalltalk snapshot: false andQuit: true
