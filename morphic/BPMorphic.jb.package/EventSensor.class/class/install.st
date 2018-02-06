class initialization
install
  "EventSensor install"

  "Install an EventSensor in place of the current Sensor."

  | _gsSqueakTemp_newSensor |
  (Smalltalk at: #'Sensor') shutDown.
  _gsSqueakTemp_newSensor := self new.
  _gsSqueakTemp_newSensor startUp.	"Note: We must use #become: here to replace all references to the old
	sensor with the new one, since Sensor is referenced from all the
	existing controllers."
  (Smalltalk at: #'Sensor') become: _gsSqueakTemp_newSensor