class functions
makeNewSubclass

	self selectedClassOrMetaClass ifNil: [^ self].
	self okToChange ifFalse: [^ self].
	self editSelection: #newClass.
	self contentsChanged.
	"Force the text view to assume there are changes"
	self changed: #editString with: self contents