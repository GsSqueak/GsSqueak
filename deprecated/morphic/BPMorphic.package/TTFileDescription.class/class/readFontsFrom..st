instance creation
readFontsFrom: aFilename 
	"Reads and returns all the fonts in the given file"
	"
	TTFileDescription readFontsFrom: 'batang.ttc'.
	"
	^ self
		openFontFile: aFilename
		do: [:file | (self fontOffsetsInFile: file)
				collect: [:offset | self new on: aFilename offset: offset]
				thenSelect: [:font | font notNil]]