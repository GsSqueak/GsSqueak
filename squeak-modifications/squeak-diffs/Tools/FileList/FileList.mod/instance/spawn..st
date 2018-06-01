file menu action
spawn: code
	"Open a simple Edit window"

	listIndex = 0 ifTrue: [^ self].
	self class openEditorOn: (directory readOnlyFileNamed: fileName)
				"read only just for initial look"
			editString: code