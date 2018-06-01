private
fullName
	"Answer the full name for the currently selected file; answer nil if no file is selected."

	^ fileName ifNotNil: [directory
		ifNil:
			[FileDirectory default fullNameFor: fileName]
		ifNotNil:
			[directory fullNameFor: fileName]]
