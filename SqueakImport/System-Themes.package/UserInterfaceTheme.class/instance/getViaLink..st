private
getViaLink: keyObject 
	"keyObject is intended to be an Association.
	If there is a linked theme, see if it has the relevant property available"
	
	^ next ifNotNil: [next get: keyObject]