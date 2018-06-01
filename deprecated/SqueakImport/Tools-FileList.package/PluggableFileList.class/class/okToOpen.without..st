validateBlocks
okToOpen: aFileNameString without: aSuffixString

	"Answer whether user confirms that it is ok to overwrite the file named in aString"
	^ 1 = (UIManager default 
				chooseFrom: #('overwrite that file' 'select another file')
				title:  aFileNameString, ' already exists.').
