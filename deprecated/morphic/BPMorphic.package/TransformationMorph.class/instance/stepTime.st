testing
stepTime
	"Answer the stepTime of my rendered morph if posible"
	| _gsSqueakTemp_rendered |
	_gsSqueakTemp_rendered := self renderedMorph.
	_gsSqueakTemp_rendered = self
		ifTrue: [^ super stepTime].
	"Hack to avoid infinite recursion"
	^ _gsSqueakTemp_rendered stepTime