structure
outermostWorldMorph

	| outer |
	self world ifNotNil: [ :world |^world].
	self flag: #arNote. "stuff below is really only for MVC"
	outer := self outermostMorphThat: [ :x | x isWorldMorph].
	outer ifNotNil: [^outer].
	self isWorldMorph ifTrue: [^self].
	^nil