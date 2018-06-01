tests-text
makeTextSpec
	| spec |
	spec := builder pluggableTextSpec new.
	spec name: #text.
	spec model: self.
	spec getText: #getText.
	spec selection: #getTextSelection.
	spec color: #getColor.
	"<-- the following cannot be tested very well -->"
	spec setText: #setText:.
	spec menu: #getMenu:.
	^spec