docking bars support
dockingBar
	^ self
		projectParameterAt: #dockingBar
		ifAbsent: [ TheWorldMainDockingBar instance ]