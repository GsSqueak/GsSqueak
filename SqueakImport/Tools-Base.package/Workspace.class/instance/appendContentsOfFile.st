menu commands
appendContentsOfFile
	"Prompt for a file, and if one is obtained, append its contents to the contents of the receiver.   Caution: as currently implemented this abandons any custom style information previously in the workspace.  Someone should fix this.  Also, for best results you should accept the contents of the workspace before requesting this."

	| fName |
	fName := UIManager default chooseFileMatching: '*' label: 'Choose file to add to workspace'.
	fName ifNil:[^self].
	
	FileStream oldFileNamed: fName do:[:aFileStream|
		contents := (contents ifNil: ['']) asString, aFileStream contentsOfEntireFile].
	self changed: #contents