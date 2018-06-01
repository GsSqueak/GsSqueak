private
paragraphClass
	container ifNil: [^ NewParagraph].
	^ container paragraphClass