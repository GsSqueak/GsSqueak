contents
classDefinitionText
	"return the text to display for the definition of the currently selected class"
	^ self selectedClassName ifNil: [''] ifNotNil: [:cls | self topazProxy classDefinitionFor: cls]