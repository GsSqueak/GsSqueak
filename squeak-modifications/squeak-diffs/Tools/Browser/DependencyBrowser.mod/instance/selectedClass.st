class list
selectedClass
	"Answer the class that is currently selected. Answer nil if no selection 
	exists."
	
	| name envt nonMetaClass nonMetaName |
	(name := self selectedClassName) ifNil: [^ nil].
	(envt := self selectedEnvironment) ifNil: [^ nil].
	nonMetaName := (name endsWith: ' class') ifTrue: [name allButLast: 6] ifFalse: [name].
	nonMetaClass := envt at: nonMetaName asSymbol ifAbsent: [^ nil].
	^ nonMetaName = name ifTrue: [nonMetaClass] ifFalse: [nonMetaClass class].
