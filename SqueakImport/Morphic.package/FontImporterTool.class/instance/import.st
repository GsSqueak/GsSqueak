actions
import
	| megaSize filenames fonts |
	fonts := self currentSelection.
	filenames := fonts allFilenames.
	megaSize := ((filenames inject: 0 into: [ :sum :fn |
		sum + (FileStream readOnlyFileNamed: fn do: [:file | file size])]) / (1024 * 1024)) asFloat.
	(UIManager default confirm: (
'About to import {1}{2}.\\This is at least {3} MB of space required int the image.\
Please respect the copyright and embedding restrictions of the font.\
Proceed?' 
		withCRs format: {
			self currentParent 
				ifNotNil: [:p| p fontname, ' ', self currentSelection fontname]
				ifNil: [self currentSelection fontname].
			filenames size > 1 ifTrue: [' (', filenames size, ' font files)'] ifFalse: [''].
			megaSize printShowingDecimalPlaces: 2}))
		ifTrue: [ 
			filenames do: [:filename | | readFonts |
				readFonts := TTCFontDescription addFromTTFile: filename.
				readFonts isCollection
					ifFalse: [TTCFont newTextStyleFromTT: readFonts]
					ifTrue: [self importFontFamily: readFonts]]].
	self allFonts: nil. "force redraw"
