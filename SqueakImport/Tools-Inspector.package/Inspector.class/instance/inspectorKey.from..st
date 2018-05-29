menu commands
inspectorKey: aChar from: view
	"Respond to a Command key issued while the cursor is over my field list"

	aChar == $i ifTrue: [^ self selection inspect].
	aChar == $I ifTrue: [^ self selection explore].
	aChar == $b ifTrue:	[^ self browseMethodFull].
	aChar == $h ifTrue:	[^ self classHierarchy].
	aChar == $c ifTrue: [^ self copyName].
	aChar == $p ifTrue: [^ self browseFullProtocol].
	aChar == $N ifTrue: [^ self browseClassRefs].
	aChar == $t ifTrue: [^ self tearOffTile].
	aChar == $v ifTrue: [^ self viewerForValue].

	^ self arrowKey: aChar from: view