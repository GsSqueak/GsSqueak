drawing-support
translateBy: delta during: aBlock
	"Set a translation only during the execution of aBlock."

	| result oldShadow |
	oldShadow := shadowColor.
	self translate: delta.
	result := aBlock value: self.
	self translate: delta negated.
	shadowColor := oldShadow.
	^ result
