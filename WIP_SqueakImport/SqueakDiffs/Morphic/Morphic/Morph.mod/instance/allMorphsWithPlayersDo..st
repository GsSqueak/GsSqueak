submorphs-add/remove
allMorphsWithPlayersDo: aTwoArgumentBlock 
	"Evaluate the given block for all morphs in this composite morph that have non-nil players.
	Also evaluate the block for the receiver if it has a player."

	submorphs do: [:m | m allMorphsWithPlayersDo: aTwoArgumentBlock ].
	self playerRepresented ifNotNil: [ :p | aTwoArgumentBlock value: self value: p ].
