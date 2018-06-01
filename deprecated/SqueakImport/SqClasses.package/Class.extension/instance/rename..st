*SqClasses-class name
rename: aString 
	"The new name of the receiver is the argument, aString."

	| oldName newName |
	(newName := aString asSymbol) = (oldName := self name)
		ifTrue: [^ self].
	(self environment includesKey: newName)
		ifTrue: [^ self error: newName , ' already exists'].
	((self environment undeclared includesKey: newName)
		and: [(self environment undeclared unreferencedKeys includes: newName) not])
		ifTrue: [self inform: 'There are references to ' , aString printString , '
from Undeclared. Check them after this change.'].
	name := newName.
	self environment renameClass: self from: oldName
