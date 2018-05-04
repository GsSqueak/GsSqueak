process primitives
primitiveResume
	"Put this process on the scheduler's lists thus allowing it to proceed next
	time there is a chance for processes of its priority level"

	self subclassResponsibility
