collection ops
do: aBlock 
	"evaluate aBlock with each character in the set"
	| _gsSqueakTemp_index |
	tally >= 128
		ifTrue: ["dense"
			_gsSqueakTemp_index := 0.
			[(_gsSqueakTemp_index := _gsSqueakTemp_index + 1) <= 256]
				whileTrue: [(map at: _gsSqueakTemp_index)
							= 1
						ifTrue: [aBlock
								value: (Character value: _gsSqueakTemp_index - 1)]].
			^ self].
	"sparse"
	_gsSqueakTemp_index := 0.
	[(_gsSqueakTemp_index := map indexOf: 1 startingAt: _gsSqueakTemp_index + 1) = 0]
		whileFalse: [aBlock
				value: (Character value: _gsSqueakTemp_index - 1)]