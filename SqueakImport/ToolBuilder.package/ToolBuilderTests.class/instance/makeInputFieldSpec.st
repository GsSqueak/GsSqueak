tests-input
makeInputFieldSpec
	| spec |
	spec := builder pluggableInputFieldSpec new.
	spec name: #input.
	spec model: self.
	spec getText: #getText.
	spec selection: #getTextSelection.
	spec color: #getColor.
	"<-- the following cannot be tested very well -->"
	spec setText: #setText:.
	spec menu: #getMenu:.
	^spec