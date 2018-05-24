client services
fileInMorphsNamed: memberName addToWorld: aBoolean
	"This will load the Morph (or Morphs) from the given member.
	Answers a Morph, or a list of Morphs, or nil if no such member or error.
	If aBoolean is true, also adds them and their models to the World."

	| member morphOrList |
	member := self memberNamed: memberName.
	member ifNil: [ ^self errorNoSuchMember: memberName ].
	self installed: member.

	morphOrList := member contentStream fileInObjectAndCode.
	morphOrList ifNil: [ ^nil ].
	aBoolean ifTrue: [ ActiveWorld addMorphsAndModel: morphOrList ].

	^morphOrList
