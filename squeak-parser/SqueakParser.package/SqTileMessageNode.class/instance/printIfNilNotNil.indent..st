printing
printIfNilNotNil: aMorph indent: level 
	| newNode |
	newNode := aMorph parseNode shallowCopy.
	newNode receiver
		ifNotNil: [newNode receiver: newNode receiver ifNilReceiver].
	"fudge so it prints right"
	(arguments first isJust: NodeNil)
		ifTrue: [^ newNode
				morphFromKeywords: #ifNotNil:
				arguments: {arguments second}
				on: aMorph
				indent: level].
	(arguments second isJust: NodeNil)
		ifTrue: [^ newNode
				morphFromKeywords: #ifNil:
				arguments: {arguments first}
				on: aMorph
				indent: level].
	^ newNode
		morphFromKeywords: #ifNil:ifNotNil:
		arguments: arguments
		on: aMorph
		indent: level