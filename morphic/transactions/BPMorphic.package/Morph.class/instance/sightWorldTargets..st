meta-actions
sightWorldTargets: event 
	"Return the potential targets for the receiver. 
	This is derived from Morph>>potentialEmbeddingTargets."
	| bullseye myWorld candidates choice |
	myWorld := self world
				ifNil: [^ #()].
	bullseye := Point fromUserWithCursor: Cursor target.
	candidates := myWorld morphsAt: bullseye.
	choice := UIManager default
				chooseFrom: (candidates
						collect: [:m | m knownName
								ifNil: [m class name]])
				values: candidates.
	choice
		ifNotNil: [self target: choice]