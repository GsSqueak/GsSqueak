navigation
transitionSpecFor: aMorph 
	^ aMorph
		valueOfProperty: #transitionSpec
		ifAbsent: ["check for special propety"
			Array
				with: 'camera'
				with: #none
				with: #none
			"... otherwise this is the default"]