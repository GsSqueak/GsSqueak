-Etoys
removePlayersIn: project 
	"Remove existing player references for project"
	References keys
		do: [:key | (References at: key) costume pasteUpMorph == project world
				ifTrue: [References removeKey: key]]