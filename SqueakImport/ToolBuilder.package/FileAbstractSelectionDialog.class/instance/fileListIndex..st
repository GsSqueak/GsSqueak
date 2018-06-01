file list
fileListIndex: anInteger
	"We've selected the file at the given index, so find the file name."

	self okToChange ifFalse: [^ self].
	listIndex := anInteger.
	listIndex = 0 
		ifTrue: [fileName := nil]
		ifFalse: [fileName := nameList at: anInteger].  "open the file selected"

	self 
		changed: #fileListIndex;
		changed: #inputText