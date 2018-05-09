preferences
allowUnderscoreAsAssignment
	"Accessor for the system-wide preference"
	<preference: 'Allow underscore assignments'
		category: 'Compiler'
		description: 'When true, underscore can be used as assignment operator'
		type: #Boolean>
	^AllowUnderscoreAssignments ifNil:[true]