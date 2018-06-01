accessing
selectedClassOrMetaClassName
	"I may know what class is currently selected"

	^self selectedClassOrMetaClass ifNotNil: [:selectedClass| selectedClass name]