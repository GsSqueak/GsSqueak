miscellaneous
setClassAndSelectorFrom: messageIDString in: csBlock 
	"Decode strings of the form <className> [class] <selectorName>. If
	<className> does not exist as a class, use nil for the class in the
	block "
	| _gsSqueakTemp_aStream _gsSqueakTemp_aClass _gsSqueakTemp_maybeClass _gsSqueakTemp_sel |
	(messageIDString isKindOf: MethodReference)
		ifTrue: [^ messageIDString setClassAndSelectorIn: csBlock].
	_gsSqueakTemp_aStream := ReadStream on: messageIDString.
	_gsSqueakTemp_aClass := Smalltalk
				at: (_gsSqueakTemp_aStream upTo: Character space) asSymbol
				ifAbsent: [].
	_gsSqueakTemp_maybeClass := _gsSqueakTemp_aStream upTo: Character space.
	_gsSqueakTemp_sel := _gsSqueakTemp_aStream upTo: Character space.
	_gsSqueakTemp_maybeClass = 'class' & (_gsSqueakTemp_sel size ~= 0)
		ifTrue: [_gsSqueakTemp_aClass
				ifNil: [csBlock value: nil value: _gsSqueakTemp_sel asSymbol]
				ifNotNil: [csBlock value: _gsSqueakTemp_aClass class value: _gsSqueakTemp_sel asSymbol]]
		ifFalse: [csBlock value: _gsSqueakTemp_aClass value: _gsSqueakTemp_maybeClass asSymbol
			"
			Utilities setClassAndSelectorFrom: 'Utilities class
			oppositeModeTo:' in: [:aClass :aSelector | Transcript cr; show:
			'Class = ', aClass name printString, ' selector = ', aSelector
			printString]. 
			Utilities setClassAndSelectorFrom: 'MessageSet
			setClassAndSelectorIn:' in: [:aClass :aSelector | Transcript cr;
			show: 'Class = ', aClass name printString, ' selector = ',
			aSelector printString]
			"]