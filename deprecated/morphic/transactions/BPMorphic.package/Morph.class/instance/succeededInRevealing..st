-Etoys-support
succeededInRevealing: aPlayer 
	aPlayer == self player
		ifTrue: [^ true].
	submorphs
		do: [:m | (m succeededInRevealing: aPlayer)
				ifTrue: [^ true]].
	^ false