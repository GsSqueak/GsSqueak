private
beginningOfLine: position
	"Redefined in subclasses using Paragraph support"
	^ (paragraph lines at:(paragraph lineIndexOfCharacterIndex: position)) first