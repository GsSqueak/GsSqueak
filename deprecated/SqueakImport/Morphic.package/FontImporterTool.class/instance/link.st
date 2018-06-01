actions
link
	| filenames fonts |
	fonts := self currentSelection.
	self warningSeen ifFalse: [
		(UIManager default confirm: (
'Note that linking a font instead of importing may make the
image un-portable, since the linked font must be present on
the system the next time the image is run.

This warning is only shown once per session.' ) trueChoice: 'Proceed' falseChoice: 'Cancel')
		ifFalse: [^ self].
		self warningSeen: true]..
	filenames := fonts allFilenames.
	filenames do: [:filename | | readFonts |
		readFonts := TTFileDescription readFontsFrom: filename.
		readFonts isCollection
					ifFalse: [TTCFont newTextStyleFromTT: readFonts]
					ifTrue: [self importFontFamily: readFonts]].
	self allFonts: nil. "force redraw"