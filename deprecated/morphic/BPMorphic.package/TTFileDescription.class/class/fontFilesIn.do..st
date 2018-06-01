font paths
fontFilesIn: path do: aBlock 
	"TTFileDescription loadAllFilesIn: 'C:\Windows\Fonts'"
	"Load all the TTF files we can find in the given path"
	| _gsSqueakTemp_fd |
	_gsSqueakTemp_fd := FileDirectory on: path.
	(_gsSqueakTemp_fd fileNamesMatching: '*.ttf;*.ttc')
		do: [:fn | (self readFontsFrom: fn)
				do: aBlock]