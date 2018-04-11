open/close
closeBoxHit
	"The user clicked on the close-box control in the window title. For Mac
	users only, the Mac convention of option-click-on-close-box is obeyed
	if the mac option key is down."
	Preferences dismissAllOnOptionClose
		ifTrue: [Sensor rawMacOptionKeyPressed
				ifTrue: [^ self world closeUnchangedWindows]].
	self delete