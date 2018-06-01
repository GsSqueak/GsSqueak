file list
fileList
	"return the list of files in the currently selected directory; if we haven't yet read an actual directory return empty lists for now"

	nameList ifNil: [nameList := dateList := sizeList := #()].
	^Array with: nameList with: dateList with: sizeList