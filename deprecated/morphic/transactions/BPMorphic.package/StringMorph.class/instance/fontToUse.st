accessing
fontToUse
	| _gsSqueakTemp_fontToUse |
	_gsSqueakTemp_fontToUse := font isNil
				ifTrue: [TextStyle defaultFont]
				ifFalse: [font].
	(emphasis isNil
			or: [emphasis = 0])
		ifTrue: [^ _gsSqueakTemp_fontToUse]
		ifFalse: [^ _gsSqueakTemp_fontToUse emphasized: emphasis]