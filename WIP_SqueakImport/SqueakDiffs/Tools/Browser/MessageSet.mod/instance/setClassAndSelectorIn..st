private
setClassAndSelectorIn: csBlock
	| sel |
	"Decode strings of the form <className> [class] <selectorName>."

	self flag: #mref.	"compatibility with pre-MethodReference lists"

	sel := self selection.
	^(sel isKindOf: MethodReference) ifTrue: [
		sel setClassAndSelectorIn: csBlock
	] ifFalse: [
		MessageSet parse: sel toClassAndSelector: csBlock
	]