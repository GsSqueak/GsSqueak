actions
link
	| _gsSqueakTemp_filenames _gsSqueakTemp_fonts |
	_gsSqueakTemp_fonts := self currentSelection.
	self warningSeen
		ifFalse: [(UIManager default
					confirm: 'Note that linking a font instead of importing may make the
image un-portable, since the linked font must be present on
the system the next time the image is run.

This warning is only shown once per session.'
					trueChoice: 'Proceed'
					falseChoice: 'Cancel')
				ifFalse: [^ self].
			self warningSeen: true].
	_gsSqueakTemp_filenames := _gsSqueakTemp_fonts allFilenames.
	_gsSqueakTemp_filenames
		do: [:filename | 
			| readFonts |
			readFonts := TTFileDescription readFontsFrom: filename.
			readFonts isCollection
				ifTrue: [self importFontFamily: readFonts]
				ifFalse: [TTCFont newTextStyleFromTT: readFonts]].
	self allFonts: nil