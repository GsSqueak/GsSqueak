compilation
nameFor: aMorph 
	"Return the name of the slot containing the given morph or nil if that
	morph has not been named."
	| _gsSqueakTemp_allNames _gsSqueakTemp_start |
	_gsSqueakTemp_allNames := self class allInstVarNames.
	_gsSqueakTemp_start := MorphicModel allInstVarNames size + 1.
	_gsSqueakTemp_start
		to: _gsSqueakTemp_allNames size
		do: [:i | (self instVarAt: i)
					== aMorph
				ifTrue: [^ _gsSqueakTemp_allNames at: i]].
	^ nil