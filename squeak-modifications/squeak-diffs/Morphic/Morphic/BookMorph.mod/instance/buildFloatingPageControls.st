navigation
buildFloatingPageControls

	| pageControls |
	pageControls := self makePageControlsFrom: self fullControlSpecs.
	pageControls borderWidth: 0; layoutInset: 4.
	pageControls  setProperty: #pageControl toValue: true.
	pageControls setNameTo: 'Page Controls'.
	pageControls color: Color yellow.
	^FloatingBookControlsMorph new addMorph: pageControls.
