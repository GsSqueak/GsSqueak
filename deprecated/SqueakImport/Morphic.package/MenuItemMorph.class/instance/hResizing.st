layout-properties
hResizing
	"Default to #spaceFill"
	| props |
	props := self layoutProperties.
	^props ifNil:[#spaceFill] ifNotNil:[props hResizing].