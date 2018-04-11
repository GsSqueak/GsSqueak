geometry eToy
heading: newHeading 
	"If we have a rendee set its heading. Else do nothing."
	| _gsSqueakTemp_rendee |
	(_gsSqueakTemp_rendee := self renderedMorph) == self
		ifTrue: [^ self].
	^ _gsSqueakTemp_rendee heading: newHeading