instance creation
newFrom: aCollection 
	"Answer an instance of me containing the same elements as
	aCollection. "
	| _gsSqueakTemp_newInterval _gsSqueakTemp_n |
	(_gsSqueakTemp_n := aCollection size) <= 1
		ifTrue: [_gsSqueakTemp_n = 0
				ifTrue: [^ self from: 1 to: 0].
			^ self from: aCollection first to: aCollection last].
	_gsSqueakTemp_newInterval := self
				from: aCollection first
				to: aCollection last
				by: aCollection last - aCollection first // (_gsSqueakTemp_n - 1).
	aCollection ~= _gsSqueakTemp_newInterval
		ifTrue: ["Give a second chance, because progression might be
			arithmetic, but = answer false"
			(_gsSqueakTemp_newInterval hasEqualElements: aCollection)
				ifFalse: [self error: 'The argument is not an arithmetic progression']].
	^ _gsSqueakTemp_newInterval"SqueakInterval newFrom: {1. 2. 3}
	{33. 5. -23} as: SqueakInterval
	{33. 5. -22} as: SqueakInterval (an error)
	(-4 to: -12 by: -1) as: SqueakInterval
	#(2 4 6) asByteArray as: SqueakInterval
	"