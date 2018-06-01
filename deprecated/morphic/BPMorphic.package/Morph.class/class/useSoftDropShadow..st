preferences
useSoftDropShadow: aBoolean 
	UseSoftDropShadow = aBoolean
		ifTrue: [^ self].
	UseSoftDropShadow := aBoolean.
	SystemWindow refreshAllWindows.
	DialogWindow refreshAllDialogs.
	SystemProgressMorph reset.
	TheWorldMainDockingBar updateInstances