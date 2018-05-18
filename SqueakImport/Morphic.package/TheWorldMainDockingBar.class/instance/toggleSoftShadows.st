submenu - extras
toggleSoftShadows

	((Preferences valueOfFlag: #menuAppearance3d ifAbsent: [false]) and: [Morph useSoftDropShadow not])
		ifFalse: [Preferences toggle: #menuAppearance3d].
	Morph useSoftDropShadow: true.
	
	SystemWindow refreshAllWindows; reconfigureWindowsForFocus.
	self class updateInstances.
	SystemProgressMorph reset.