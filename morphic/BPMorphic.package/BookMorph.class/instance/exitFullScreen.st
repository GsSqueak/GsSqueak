other
exitFullScreen
	| _gsSqueakTemp_floater |
	self isInFullScreenMode
		ifFalse: [^ self].
	self setProperty: #fullScreenMode toValue: false.
	(self hasProperty: #showWorldMainDockingBarWhenNotFullScreen)
		ifTrue: [MorphicProject current
				showWorldMainDockingBar: (self valueOfProperty: #showWorldMainDockingBarWhenNotFullScreen).
			self removeProperty: #showWorldMainDockingBarWhenNotFullScreen].
	_gsSqueakTemp_floater := self
				valueOfProperty: #floatingPageControls
				ifAbsent: [].
	_gsSqueakTemp_floater
		ifNotNil: [_gsSqueakTemp_floater delete.
			self removeProperty: #floatingPageControls].
	self position: 0 @ 0.
	self adjustCurrentPageForFullScreen