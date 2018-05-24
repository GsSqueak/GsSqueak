navigation
buildFloatingPageControls
	| _gsSqueakTemp_pageControls |
	_gsSqueakTemp_pageControls := self makePageControlsFrom: self fullControlSpecs.
	_gsSqueakTemp_pageControls borderWidth: 0;
		 layoutInset: 4.
	_gsSqueakTemp_pageControls setProperty: #pageControl toValue: true.
	_gsSqueakTemp_pageControls setNameTo: 'Page Controls'.
	_gsSqueakTemp_pageControls color: Color yellow.
	^ FloatingBookControlsMorph new addMorph: _gsSqueakTemp_pageControls