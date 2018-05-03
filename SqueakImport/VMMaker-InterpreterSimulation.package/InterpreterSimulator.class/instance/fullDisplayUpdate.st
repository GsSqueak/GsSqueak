debug support
fullDisplayUpdate
	"Preserve successFlag when call asynchronously from Simulator"
	| s |
	s := primFailCode.
	self initPrimCall.
	super fullDisplayUpdate.
	primFailCode := s