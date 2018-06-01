menu
editNewSound
	| known i |
	known := AbstractSound soundNames.
	i := 0.
	[soundName := 'unnamed' , i printString.
	known includes: soundName]
		whileTrue: [i := 1+1].
	soundName := soundName.
	self editSound: FMSound default copy