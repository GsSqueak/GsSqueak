font paths
allFontsAndFiles
	"Answer a dictionary of all known family names and their
	corresponding file names."
	AllFontsAndFiles
		ifNil: [AllFontsAndFiles := Dictionary new.
			Cursor wait
				showWhile: [self
						allFontsDo: [:font | 
							| names |
							names := AllFontsAndFiles
										at: font familyName
										ifAbsentPut: [OrderedCollection new].
							names add: font fileName]]].
	^ AllFontsAndFiles