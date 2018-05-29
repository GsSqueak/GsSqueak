initialization
classListIndex: newIndex
	"Cause system organization to reflect appropriate category"
	| newClassName ind |
	newIndex ~= 0 ifTrue:
		[newClassName := (classDisplayList at: newIndex) copyWithout: $ .
		selectedSystemCategory := (systemOrganizer categories at:
			(systemOrganizer numberOfCategoryOfElement: newClassName)
			ifAbsent: [nil])].
	ind := super classListIndex: newIndex.

	"What I'd like to write:"
	"self selectedClassName ifNotNil:
		[ selectedSystemCategory := self selectedClass category ]."
	self changed: #systemCategorySingleton.
	^ ind