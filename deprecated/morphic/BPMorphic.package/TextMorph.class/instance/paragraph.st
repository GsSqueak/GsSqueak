private
paragraph
	"Paragraph instantiation is lazy -- create it only when needed"
	^ paragraph
		ifNil: [self createParagraph]