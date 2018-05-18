events
mouseEnter: evt
	"The mouse entered the receiver"

	owner ifNotNil: [ owner selectItem: self event: evt ]