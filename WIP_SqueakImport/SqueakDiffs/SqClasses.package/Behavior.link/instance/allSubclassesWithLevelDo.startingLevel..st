*SqClasses-accessing class hierarchy
allSubclassesWithLevelDo: classAndLevelBlock startingLevel: level 
	"Walk the tree of subclasses, giving the class and its level"

	classAndLevelBlock value: self value: level.
	self == Class ifTrue:  [^ self].  "Don't visit all the metaclasses"
	"Visit subclasses in alphabetical order"
	self subclasses
		sort: [ :a :b | a name <= b name ];
		do: [ :subclass | 
			subclass
				allSubclassesWithLevelDo: classAndLevelBlock
				startingLevel: level + 1 ]
