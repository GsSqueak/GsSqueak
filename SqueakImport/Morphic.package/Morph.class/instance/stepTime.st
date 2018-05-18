testing
stepTime
	"Answer the desired time between steps in milliseconds. This default implementation requests that the 'step' method be called once every second."

	^ self topRendererOrSelf player ifNotNil: [10] ifNil: [1000]