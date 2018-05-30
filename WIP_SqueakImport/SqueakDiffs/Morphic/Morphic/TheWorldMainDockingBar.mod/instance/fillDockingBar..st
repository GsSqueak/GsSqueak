construction
fillDockingBar: aDockingBar 
	"Private - fill the given docking bar"
	
	self menusOn: aDockingBar.
	aDockingBar addSpacer.
	self projectNameOn: aDockingBar.
	aDockingBar addSpacer.
	self rightSideOn: aDockingBar.
	aDockingBar
		setProperty: #mainDockingBarTimeStamp 
		toValue: self class timeStamp.