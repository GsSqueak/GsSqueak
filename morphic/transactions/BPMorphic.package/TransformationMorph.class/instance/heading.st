geometry eToy
heading
	"End recusion when necessary."
	| _gsSqueakTemp_rendee |
	(_gsSqueakTemp_rendee := self renderedMorph) == self
		ifTrue: [^ 0.0].
	^ _gsSqueakTemp_rendee heading