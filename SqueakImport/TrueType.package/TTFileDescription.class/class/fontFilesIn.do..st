font paths
fontFilesIn: path do: aBlock
	"TTFileDescription loadAllFilesIn: 'C:\Windows\Fonts'"
	"Load all the TTF files we can find in the given path"
	| fd |
	fd := FileDirectory on: path.
	(fd fileNamesMatching: '*.ttf;*.ttc') do:[:fn|
		(self readFontsFrom: fn) do: aBlock ]