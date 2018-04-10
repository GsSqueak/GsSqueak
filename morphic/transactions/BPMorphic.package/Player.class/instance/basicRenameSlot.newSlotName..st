slots-user
basicRenameSlot: oldSlotName newSlotName: newSlotName 
	"Give an existing instance variable a new name"
	self class renameSilentlyInstVar: oldSlotName to: newSlotName.
	self renameSlotInWatchersOld: oldSlotName new: newSlotName.
	self updateAllViewers.
	self presenter allExtantPlayers
		do: [:aPlayer | (aPlayer hasScriptReferencing: oldSlotName ofPlayer: self)
				ifTrue: [aPlayer
						noteRenameOf: oldSlotName
						to: newSlotName
						inPlayer: self]].
	self presenter hasAnyTextuallyCodedScripts
		ifTrue: [self inform: 'Caution!  References in texutally coded scripts won''t be renamed.'].
	^ true