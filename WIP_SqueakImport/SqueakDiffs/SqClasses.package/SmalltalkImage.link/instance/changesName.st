image, changes names
changesName
	"Answer the name for the changes file corresponding to the image file name."
	"Smalltalk changesName"

	| imName |
	imName := FileDirectory baseNameFor: self imageName.
	^ imName, FileDirectory dot, 'changes'
