other
goFullScreen
	| _gsSqueakTemp_floater |
	self isInFullScreenMode
		ifTrue: [^ self].
	self setProperty: #fullScreenMode toValue: true.
	self setProperty: #showWorldMainDockingBarWhenNotFullScreen toValue: Project current showWorldMainDockingBar.
	Project current showWorldMainDockingBar: false.
	self position: (currentPage topLeft - self topLeft) negated.
	self adjustCurrentPageForFullScreen.
	_gsSqueakTemp_floater := self buildFloatingPageControls.
	self setProperty: #floatingPageControls toValue: _gsSqueakTemp_floater.
	_gsSqueakTemp_floater openInWorld