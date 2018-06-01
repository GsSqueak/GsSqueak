preferences
allowUnderscoreAsAssignment
	"Accessor for the system-wide preference"
	^ AllowUnderscoreAssignments ifNil: [true]