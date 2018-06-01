scripts-standard
turn: degrees 
	"Rotate the heading of the object by the given number of degrees"
	degrees
		ifNil: [^ self].
	degrees = 0
		ifTrue: [^ self].
	self setHeading: self getHeading + degrees asFloat \\ 360.0