preferences
prefAllowUnderscoreSelectors
	"Accessor for the system-wide preference"
	<preference: 'Allow underscore selectors'
		category: 'Compiler'
		description: 'When true, underscore can be used in selectors and varibable names'
		type: #Boolean>
	^AllowUnderscoreSelectors ifNil:[false]