header
headerParagraph
	"Return a paragraph for the footer"
	| hPara rect paragraphClass |
	paragraphClass := Smalltalk at: #Paragraph
				ifAbsent: [^ self notify: 'MVC class Paragraph not present'].
	hPara := paragraphClass new.
	hPara destinationForm: form.
	rect := (self in2pix: self textArea topLeft - (0.0@self headerHeight)) corner: 
				(self in2pix: self textArea topRight).
	hPara clippingRectangle: rect.
	hPara compositionRectangle: rect.
	^hPara