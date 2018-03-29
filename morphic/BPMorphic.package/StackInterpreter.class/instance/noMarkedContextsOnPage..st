object memory support
noMarkedContextsOnPage: thePage 
	"Answer true if there are no marked contexts on thePage."
	| _gsSqueakTemp_theFP |
	self assert: (stackPages isFree: thePage) not.
	_gsSqueakTemp_theFP := thePage headFP.
	[(self frameHasContext: _gsSqueakTemp_theFP)
		ifTrue: [self
				assert: (objectMemory
						isContext: (self frameContext: _gsSqueakTemp_theFP)).
			(objectMemory
					isMarked: (self frameContext: _gsSqueakTemp_theFP))
				ifTrue: [^ false]].
	(_gsSqueakTemp_theFP := self frameCallerFP: _gsSqueakTemp_theFP) ~= 0] whileTrue.
	^ true