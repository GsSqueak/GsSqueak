preferences
allowBlockArgumentAssignment
	"Accessor for the system-wide preference"
	
	<preference: 'Allow block argument assignment.'
		category: 'Compiler'
		description: 'If enabled, the compiler will allow assignment into block arguments.
This provides backward compatibility with the pre-closure compiler.'
		type: #Boolean>
	^AllowBlockArgumentAssignment ifNil: [ false ]