navigation
transitionSpecFor: aMorph
	^ aMorph valueOfProperty: #transitionSpec  " check for special propety"
		ifAbsent: [Array with: 'silence'  " ... otherwise this is the default"
						with: #none
						with: #none]