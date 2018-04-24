*SqClasses-*SqClasses-*SqClasses-classes and traits
renamedClass: aClass from: oldName to: newName
	"Inform Smalltalk that aClass has been renamed"
	(Array with: StartUpList with: ShutDownList) do:[:list | | index |  
		index := list indexOf: oldName.
		index > 0 ifTrue: [list at: index put: newName].
	].
