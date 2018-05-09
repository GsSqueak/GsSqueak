preferences
prefAllowUnicharSymbol
	"Accessor for the system-wide preference"
	<preference: 'Allow symbols with unique character like #,'
		category: 'Compiler'
		description: 'When true, the historical syntax #, #; or #. is allowed.'
		type: #Boolean>
	^AllowUnicharSymbol ifNil: [false]