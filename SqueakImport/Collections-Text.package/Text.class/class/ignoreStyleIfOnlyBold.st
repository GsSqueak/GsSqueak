preferences
ignoreStyleIfOnlyBold
		<preference: 'Ignore style if only bold' category: 'browsing' description: 'If true, then any method submission in which the only style change is for bolding will be treated as a method with no style specifications.' type: #Boolean>
		^ IgnoreStyleIfOnlyBold ifNil: [true].