event handling
pauseEventRecorderIn: aWorld
	"Suspend my recorder prior to a project change, and return it.
	It will be resumed after starting the new project."

	^ recorder pauseIn: aWorld