Postscript generation
preserveStateDuring: aBlock 
	"Note that this method supplies self, an encoder, to the block"
	| retval |
	self print: 'gsave';
		 cr.
	retval := aBlock value: self.
	self print: 'grestore';
		 cr.
	^ retval