examples
loadAllFontFiles
	"Load all the TTF files we can find in all font paths"
	"
		TTFileDescription loadAllFontFiles.
	"
	self fontPathsDo:[:path| | fd |
		fd := FileDirectory on: path.
		(fd fileNamesMatching: '*.ttf;*.ttc') do:[:fn|
			(self readFontsFrom: fn) do:[:font|
				(1 to: font numGlyphs) 
					do:[:i| font readGlyphAt: i-1] 
					displayingProgress: 'Reading ', font name].
		] displayingProgress: 'Scanning ', path.
	].