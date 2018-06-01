balloon help
deleteBalloonTarget: aMorph
	"Delete any existing balloon help."
	
	self balloonHelpList
		do: [:ea | ea delete];
		removeAll.