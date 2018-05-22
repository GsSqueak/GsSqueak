layout-properties
vResizing
	"Default to #shrinkWrap"
	| props |
	props := self layoutProperties.
	^props ifNil:[#shrinkWrap] ifNotNil:[props vResizing].