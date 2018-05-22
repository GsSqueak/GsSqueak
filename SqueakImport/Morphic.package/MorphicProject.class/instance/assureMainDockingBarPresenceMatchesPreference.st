docking bars support
assureMainDockingBarPresenceMatchesPreference
	"Synchronize the state of the receiver's dockings with the  
	preference"
	(self showWorldMainDockingBar)
		ifTrue: [self createOrUpdateMainDockingBar]
		ifFalse: [self removeMainDockingBar]