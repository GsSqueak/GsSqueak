world state
pauseEventRecorder
	"Suspend any event recorder, and return it if found"

	
	worldState handsDo: [:h | | er | (er := h pauseEventRecorderIn: self) ifNotNil: [^ er]].
	^ nil