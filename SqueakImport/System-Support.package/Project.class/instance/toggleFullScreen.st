menu messages
toggleFullScreen
	"Toggle between full screen and windowed mode."
	self lastScreenModeSelected
		ifTrue: [ self fullScreenOff ]
		ifFalse: [ self fullScreenOn ]