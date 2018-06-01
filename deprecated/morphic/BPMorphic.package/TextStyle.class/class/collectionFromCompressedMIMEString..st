mime file in/out
collectionFromCompressedMIMEString: aString 
	"aString holds a compressed, Base64 representation of a
	SmartRefStream storage of a TextStyle.
	Install the TextStyle."
	| _gsSqueakTemp_this _gsSqueakTemp_newName _gsSqueakTemp_style _gsSqueakTemp_data |
	_gsSqueakTemp_data := (Base64MimeConverter mimeDecode: aString as: String) unzipped.
	(RWBinaryOrTextStream with: _gsSqueakTemp_data) reset; fileIn.
	_gsSqueakTemp_this := SmartRefStream scannedObject.
	"now install it"
	_gsSqueakTemp_newName := _gsSqueakTemp_this fontArray first familyName.
	_gsSqueakTemp_this fontArray
		do: [:aFont | aFont familyName = _gsSqueakTemp_newName
				ifFalse: [self error: 'All must be same family']].
	_gsSqueakTemp_style := TextConstants
				at: _gsSqueakTemp_newName asSymbol
				ifAbsent: [^ TextConstants at: _gsSqueakTemp_newName asSymbol put: _gsSqueakTemp_this].
	"new family"
	_gsSqueakTemp_this fontArray
		do: [:aFont | 
			| heights |
			"add new fonts"
			heights := _gsSqueakTemp_style fontArray
						collect: [:bFont | bFont height].
			(heights includes: aFont height)
				ifFalse: [_gsSqueakTemp_style fontAt: _gsSqueakTemp_style fontArray size + 1 put: aFont]]