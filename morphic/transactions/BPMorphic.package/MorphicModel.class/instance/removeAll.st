compilation
removeAll
	"Clear out all script methods and subpart instance variables in me.
	Start over."
	"self removeAll"
	"MorphicModel2 removeAll"
	self class == MorphicModel
		ifTrue: [^ self].
	"Must be a subclass!"
	self class removeCategory: 'scripts'.
	self class instVarNames
		do: [:nn | self class removeInstVarName: nn]