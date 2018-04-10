scripts-kernel
noteRenameOf: oldSlotName to: newSlotName inPlayer: aPlayer 
	"Note that aPlayer has renamed a slot formerly known as oldSlotName
	to be newSlotName"
	self allScriptEditors
		do: [:anEditor | (anEditor showingMethodPane not
					and: [anEditor hasScriptReferencing: oldSlotName ofPlayer: aPlayer])
				ifTrue: [anEditor
						replaceReferencesToSlot: oldSlotName
						inPlayer: aPlayer
						with: newSlotName]]