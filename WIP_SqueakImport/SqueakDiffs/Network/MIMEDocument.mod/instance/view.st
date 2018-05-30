interactions
view
	
	self containsViewableImage
		ifTrue: [^ self viewImage].
	(StringHolder new contents: self bodyTextFormatted;
		 yourself)
		openLabel: (self name ifNil: ['(a message part)'])