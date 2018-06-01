accessing
forwardDirection
	"Return the rendee's forward direction. 
	If I have no rendee then return 0.0 degrees"
	| _gsSqueakTemp_rendee |
	(_gsSqueakTemp_rendee := self renderedMorph) == self
		ifTrue: [^ 0.0].
	^ _gsSqueakTemp_rendee forwardDirection