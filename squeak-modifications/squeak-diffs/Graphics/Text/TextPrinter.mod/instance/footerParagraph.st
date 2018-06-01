footer
footerParagraph
	"Return a paragraph for the footer"
	| fPara rect paragraphClass |
	paragraphClass := Smalltalk at: #Paragraph
				ifAbsent: [^ self notify: 'MVC class Paragraph not present'].
	fPara := paragraphClass new.
	fPara destinationForm: form.
	rect := (self in2pix: self textArea bottomLeft) corner: 
				(self in2pix: self textArea bottomRight + (0.0@self footerHeight)).
	fPara clippingRectangle: rect.
	fPara compositionRectangle: rect.
	^fPara