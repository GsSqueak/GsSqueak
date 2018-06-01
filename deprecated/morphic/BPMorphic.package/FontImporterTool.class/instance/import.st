actions
import
	| _gsSqueakTemp_megaSize _gsSqueakTemp_filenames _gsSqueakTemp_fonts |
	_gsSqueakTemp_fonts := self currentSelection.
	_gsSqueakTemp_filenames := _gsSqueakTemp_fonts allFilenames.
	_gsSqueakTemp_megaSize := ((_gsSqueakTemp_filenames
				inject: 0
				into: [:sum :fn | sum
						+ (FileStream
								readOnlyFileNamed: fn
								do: [:file | file size])])
				/ (1024 * 1024)) asFloat.
	(UIManager default
			confirm: ('About to import {1}{2}.\\This is at least {3} MB of space required int the image.\
Please respect the copyright and embedding restrictions of the font.\
Proceed?' withCRs format: {self currentParent
						ifNil: [self currentSelection fontname]
						ifNotNil: [:p | p fontname , ' ' , self currentSelection fontname]. _gsSqueakTemp_filenames size > 1
						ifTrue: [' (' , _gsSqueakTemp_filenames size , ' font files)']
						ifFalse: ['']. _gsSqueakTemp_megaSize printShowingDecimalPlaces: 2}))
		ifTrue: [_gsSqueakTemp_filenames
				do: [:filename | 
					| readFonts |
					readFonts := TTCFontDescription addFromTTFile: filename.
					readFonts isCollection
						ifTrue: [self importFontFamily: readFonts]
						ifFalse: [TTCFont newTextStyleFromTT: readFonts]]].
	self allFonts: nil