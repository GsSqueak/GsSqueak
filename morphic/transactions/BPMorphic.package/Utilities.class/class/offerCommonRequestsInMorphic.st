common requests
offerCommonRequestsInMorphic
	"Offer up the common-requests menu. If the user chooses one, then
	evaluate it, and -- provided the value is a number or string -- show it
	in the Transcript."
	"Utilities offerCommonRequests"
	| _gsSqueakTemp_aMenu _gsSqueakTemp_strings |
	(CommonRequestStrings == nil
			or: [CommonRequestStrings isKindOf: Array])
		ifTrue: [self initializeCommonRequestStrings].
	_gsSqueakTemp_strings := CommonRequestStrings contents.
	_gsSqueakTemp_aMenu := MenuMorph new.
	_gsSqueakTemp_aMenu title: 'Common Requests' translated.
	_gsSqueakTemp_aMenu addStayUpItem.
	_gsSqueakTemp_strings asString
		linesDo: [:aString | aString = '-'
				ifTrue: [_gsSqueakTemp_aMenu addLine]
				ifFalse: [_gsSqueakTemp_aMenu
						add: (aString
								ifEmpty: [' '])
						target: self
						selector: #eval:
						argument: aString]].
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu
		add: 'edit this list' translated
		target: self
		action: #editCommonRequestStrings.
	_gsSqueakTemp_aMenu popUpInWorld: self currentWorld