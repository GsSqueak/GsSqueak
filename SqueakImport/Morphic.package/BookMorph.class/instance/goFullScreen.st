other
goFullScreen
	| floater |
	self isInFullScreenMode ifTrue: [ ^ self ].
	self
		setProperty: #fullScreenMode
		toValue: true.
	self
		setProperty: #showWorldMainDockingBarWhenNotFullScreen
		toValue: Project current showWorldMainDockingBar.
	Project current showWorldMainDockingBar: false.
	self position: (currentPage topLeft - self topLeft) negated.
	self adjustCurrentPageForFullScreen.
	floater := self buildFloatingPageControls.
	self
		setProperty: #floatingPageControls
		toValue: floater.
	floater openInWorld