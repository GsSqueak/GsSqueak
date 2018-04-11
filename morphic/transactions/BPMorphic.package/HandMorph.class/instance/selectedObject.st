selected object
selectedObject
	"answer the selected object for the hand or nil is none"
	| _gsSqueakTemp_halo |
	_gsSqueakTemp_halo := self halo.
	_gsSqueakTemp_halo isNil
		ifTrue: [^ nil].
	^ _gsSqueakTemp_halo target renderedMorph