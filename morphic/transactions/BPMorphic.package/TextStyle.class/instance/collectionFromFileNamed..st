fonts and font indexes
collectionFromFileNamed: fileName 
	"Read the file. It is an TextStyle whose StrikeFonts are to be added to
	the system. (Written by fooling SmartRefStream, so it won't write a
	DiskProxy!) These fonts will be added to the master TextSytle for this
	font family. 
	To write out fonts: 
	| ff | ff := ReferenceStream fileNamed: 'new fonts'.
	TextConstants at: #forceFontWriting put: true.
	ff nextPut: (TextConstants at: #AFontName).
	'do not mix font families in the TextStyle written out'.
	TextConstants at: #forceFontWriting put: false.
	ff close.
	
	To read: (TextStyle default collectionFromFileNamed: 'new fonts')
	*** Do not remove this method ***"
	| _gsSqueakTemp_ff _gsSqueakTemp_this _gsSqueakTemp_newName _gsSqueakTemp_style |
	_gsSqueakTemp_ff := ReferenceStream fileNamed: fileName.
	_gsSqueakTemp_this := _gsSqueakTemp_ff nextAndClose.
	"Only works if file created by special code above"
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