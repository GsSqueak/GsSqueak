classes and traits
renameClassNamed: oldName as: newName
	"DO NOT DEPRECATE - Invoked from fileouts.  If there is currently a class in the system named oldName, then rename it to newName.  If anything untoward happens, report it in the Transcript.  "

	^globals renameClassNamed: oldName as: newName
