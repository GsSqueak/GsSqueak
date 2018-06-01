printing
printText: aText
	"Print aText"
	| paragraphClass |
	form isNil ifTrue:[
		form := Form extent: self pixelSize depth: depth.
	].
	paragraphClass := Smalltalk at: #Paragraph
				ifAbsent: [^ self notify: 'MVC class Paragraph not present'].
	para := paragraphClass withText: aText asText.
	Cursor wait showWhile:[
		self printParagraph.
	].