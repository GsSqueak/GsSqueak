writing
project
	"Return the project we are writing or nil"

	(topCall respondsTo: #isCurrentProject) ifTrue: [^ topCall].
	(topCall respondsTo: #do:) ifTrue: [1 to: 5 do: [:ii | 
		((topCall at: ii ifAbsent: [ ^nil ]) respondsTo: #isCurrentProject) ifTrue: [^ topCall at: ii]]].
	^ nil