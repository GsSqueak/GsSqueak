updating
update: aParameter
	super update: aParameter.
	aParameter == #appendEntry 
		ifTrue: [self flush]. "Transcript is being redirected to this steam, stdout"
	