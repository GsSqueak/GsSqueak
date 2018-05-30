navigation
transitionSpecFor: aMorph
	^ aMorph valueOfProperty: #transitionSpec  " check for special propety"
		ifAbsent: [Array with: 'camera'  " ... otherwise this is the default"
						with: #none
						with: #none]