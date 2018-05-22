geometry eToy
forwardDirection: degrees
	"If not rotating normally, update my rotatedForm"
	super forwardDirection: degrees.
	rotationStyle == #normal ifFalse:[self layoutChanged].