common requests
offerCommonRequests
	"Offer up the common-requests menu. If the user chooses one, then
	evaluate it, and -- provided the value is a number or string -- show it
	in the Transcript."
	"Utilities offerCommonRequests"
	| _gsSqueakTemp_reply _gsSqueakTemp_result _gsSqueakTemp_index _gsSqueakTemp_normalItemCount _gsSqueakTemp_strings _gsSqueakTemp_lines |
	Smalltalk isMorphic
		ifTrue: [^ self offerCommonRequestsInMorphic].
	(CommonRequestStrings == nil
			or: [CommonRequestStrings isKindOf: Array])
		ifTrue: [self initializeCommonRequestStrings].
	_gsSqueakTemp_strings := CommonRequestStrings contents.
	_gsSqueakTemp_lines := _gsSqueakTemp_strings asString lines copyWith: 'edit this menu'.
	_gsSqueakTemp_normalItemCount := _gsSqueakTemp_lines size - 1.
	_gsSqueakTemp_index := UIManager default
				chooseFrom: _gsSqueakTemp_lines
				lines: (Array with: _gsSqueakTemp_normalItemCount).
	_gsSqueakTemp_index = 0
		ifTrue: [^ self].
	_gsSqueakTemp_index > _gsSqueakTemp_normalItemCount
		ifTrue: [^ self editCommonRequestStrings].
	_gsSqueakTemp_reply := _gsSqueakTemp_lines at: _gsSqueakTemp_index.
	_gsSqueakTemp_reply size = 0
		ifTrue: [^ self].
	_gsSqueakTemp_result := Compiler evaluate: _gsSqueakTemp_reply.
	_gsSqueakTemp_result isNumber | _gsSqueakTemp_result isString
		ifTrue: [Transcript cr; nextPutAll: _gsSqueakTemp_result printString]