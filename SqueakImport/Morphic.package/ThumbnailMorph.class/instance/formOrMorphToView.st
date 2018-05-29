what to view
formOrMorphToView
	"Answer the form to be viewed, or the morph to be viewed, or nil"

	| actualViewee |
	(objectToView isForm) ifTrue: [^objectToView].
	actualViewee := viewSelector ifNil: [objectToView]
				ifNotNil: [objectToView perform: viewSelector].
	^actualViewee == 0 
		ifTrue: [nil	"valueAtCursor result for an empty HolderMorph"]
		ifFalse: 
			[(actualViewee isPlayerLike) 
				ifTrue: [actualViewee costume]
				ifFalse: [actualViewee]]