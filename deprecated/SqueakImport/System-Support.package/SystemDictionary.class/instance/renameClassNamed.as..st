classes and traits
renameClassNamed: oldName as: newName
	"Invoked from fileouts:  if there is currently a class in the system named oldName, then rename it to newName.  If anything untoward happens, report it in the Transcript.  "

	| oldClass |
	(oldClass := self at: oldName asSymbol ifAbsent: [nil]) == nil
		ifTrue:
			[Transcript cr; show: 'Class-rename for ', oldName, ' ignored because ', oldName, ' does not exist.'.
			^ self].

	oldClass rename: newName