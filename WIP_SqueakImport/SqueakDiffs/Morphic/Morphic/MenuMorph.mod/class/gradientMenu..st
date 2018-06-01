preferences
gradientMenu: aBoolean

	GradientMenu = aBoolean ifTrue: [^ self].
	GradientMenu := aBoolean.

	self flag: #refactor. "mt: Heavy use of the gradient-menu property..."
	
	SystemProgressMorph reset.
	PluggableTextMorph flushAdornmentCache.

	MenuMorph allSubInstancesDo: [:ea | ea setDefaultParameters; setTitleParameters; updateColor].
	DockingBarMorph allSubInstancesDo: [:ea | ea setDefaultParameters; updateColor].

	TheWorldMainDockingBar updateInstances.
	PluggableListMorph allSubInstancesDo: [:ea | ea setListParameters].
	SimpleHierarchicalListMorph allSubInstancesDo: [:ea | ea setDefaultParameters].
	