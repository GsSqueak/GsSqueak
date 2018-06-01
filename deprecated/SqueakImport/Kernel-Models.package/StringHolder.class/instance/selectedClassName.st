accessing
selectedClassName
	"I may know what class is currently selected"

	^self selectedClass ifNotNil: [:selectedClass| selectedClass name]