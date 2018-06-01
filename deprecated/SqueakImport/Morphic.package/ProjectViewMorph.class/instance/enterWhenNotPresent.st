events
enterWhenNotPresent

	self withProgressDo: [
		project enter: false revert: false saveForRevert: false.	"will bring it in"
	] 

