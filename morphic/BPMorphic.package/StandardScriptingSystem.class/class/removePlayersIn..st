-Etoys
removePlayersIn: project 
	"Remove existing player references for project"
	project world presenter reallyAllExtantPlayers
		do: [:pl | References
				removeKey: (project world uniqueNameForReferenceFor: pl)
				ifAbsent: []]