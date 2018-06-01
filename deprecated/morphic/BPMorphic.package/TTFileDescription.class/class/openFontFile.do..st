instance creation
openFontFile: fontFileName do: aBlock 
	"Open the font with the given font file name"
	| _gsSqueakTemp_fontFilePath _gsSqueakTemp_file |
	_gsSqueakTemp_fontFilePath := FontPaths
				at: fontFileName
				ifAbsentPut: [self findFontFile: fontFileName].
	_gsSqueakTemp_fontFilePath
		ifNil: [^ nil].
	_gsSqueakTemp_file := [FileStream readOnlyFileNamed: _gsSqueakTemp_fontFilePath]
				on: Error
				do: [:ex | 
					"We lost the font; someone might have moved it away"
					_gsSqueakTemp_fontFilePath
						removeKey: fontFileName
						ifAbsent: [].
					^ nil].
	^ [aBlock value: _gsSqueakTemp_file binary]
		ensure: [_gsSqueakTemp_file close]