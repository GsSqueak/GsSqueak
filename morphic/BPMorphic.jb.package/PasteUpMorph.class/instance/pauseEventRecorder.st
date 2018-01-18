world state
pauseEventRecorder	"Suspend any event recorder, and return it if found"	worldState		handsDo: [:h | (h pauseEventRecorderIn: self)				ifNotNil: [:er | ^ er]].	^ nil