sourcePointer conversion
fileIndexFromSourcePointer: anInteger
	"Return the index of the source file which contains the source chunk addressed by anInteger"
	"This implements the recent 32M source file algorithm"

	| hi |
	hi := anInteger // 16r1000000.
	^hi < 3
		ifTrue: [hi]
		ifFalse: [hi - 2]