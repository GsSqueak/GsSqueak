as yet unclassified
testWith: anObject
	"As a test of DataStream/ReferenceStream, write out anObject and read it back.
	11/19/92 jhm: Set the file type. More informative file name."
	"DataStream testWith: 'hi'"
	"ReferenceStream testWith: 'hi'"
	| file result |

	file := FileStream fileNamed: (self name, ' test').
	file binary.
	(self on: file) nextPut: anObject.
	file close.

	file := FileStream fileNamed: (self name, ' test').
	file binary.
	result := (self on: file) next.
	file close.
	(anObject class whichClassIncludesSelector: #=) == Object ifFalse:
		[self assert: result = anObject].
	^result