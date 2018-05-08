class initialization
install	"EventSensor install"
	"Install an EventSensor in place of the current Sensor."
	| newSensor |
	Sensor shutDown.
	newSensor := self new.
	newSensor startUp.
	"Note: We must use #become: here to replace all references to the old sensor with the new one, since Sensor is referenced from all the existing controllers."
	Sensor becomeForward: newSensor. "done"