private
asMorph
	"Answer the morph version of the receiver"
	| morph |
	morph := MorphHierarchyListMorph
				on: self
				list: #roots
				selected: nil
				changeSelected: #selected:.
	""
	^ morph inAContainer