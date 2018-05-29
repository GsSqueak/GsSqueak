class functions
fileOutClass
	"Print a description of the selected class onto a file whose name is the 
	category name followed by .st."

Cursor write showWhile:
		[self hasClassSelected ifTrue: [self selectedClass fileOut]]