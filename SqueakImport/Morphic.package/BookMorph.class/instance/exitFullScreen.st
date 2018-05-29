other
exitFullScreen
	| floater |
	self isInFullScreenMode ifFalse: [ ^ self ].
	self
		setProperty: #fullScreenMode
		toValue: false.
	(self hasProperty: #showWorldMainDockingBarWhenNotFullScreen) ifTrue:
		[ MorphicProject current showWorldMainDockingBar: (self valueOfProperty: #showWorldMainDockingBarWhenNotFullScreen).
		self removeProperty: #showWorldMainDockingBarWhenNotFullScreen ].
	floater := self
		valueOfProperty: #floatingPageControls
		ifAbsent: [  ].
	floater ifNotNil:
		[ floater delete.
		self removeProperty: #floatingPageControls ].
	self position: 0 @ 0.
	self adjustCurrentPageForFullScreen