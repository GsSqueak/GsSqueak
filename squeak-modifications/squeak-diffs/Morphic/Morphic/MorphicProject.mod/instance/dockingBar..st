docking bars support
dockingBar: aTheWorldMainDockingBar 
	self
		projectParameterAt: #dockingBar
		put: aTheWorldMainDockingBar.
	self isCurrentProject ifTrue: [ TheWorldMainDockingBar instance: aTheWorldMainDockingBar ]