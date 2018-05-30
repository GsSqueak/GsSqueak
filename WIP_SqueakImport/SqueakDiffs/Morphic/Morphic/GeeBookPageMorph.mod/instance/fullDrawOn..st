drawing
fullDrawOn: aCanvas

	aCanvas 
		translateTo: self topLeft + aCanvas origin - geeMailRectangle origin 
		clippingTo: (bounds translateBy: aCanvas origin) 
		during: [ :c |
			geeMail disablePageBreaksWhile: [geeMail fullDrawOn: c].
		].
