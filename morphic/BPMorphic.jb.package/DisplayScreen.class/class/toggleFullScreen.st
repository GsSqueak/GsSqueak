screen modes
toggleFullScreen	"Toggle between full screen and windowed mode."	self displayIsFullScreen		ifTrue: [self fullScreenOff]		ifFalse: [self fullScreenOn]