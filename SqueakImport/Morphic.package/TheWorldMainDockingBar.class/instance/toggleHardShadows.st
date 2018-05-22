submenu - extras
toggleHardShadows

	((Preferences valueOfFlag: #menuAppearance3d ifAbsent: [false]) and: [Morph useSoftDropShadow])
		ifFalse: [Preferences toggle: #menuAppearance3d].
	Morph useSoftDropShadow: false.
	
	SystemWindow refreshAllWindows; reconfigureWindowsForFocus.
	self class updateInstances.
	SystemProgressMorph reset.