initialize
becomeActiveDuring: aBlock
	"Make the receiver the ActiveEvent during the evaluation of aBlock."

	| priorEvent |
	priorEvent := ActiveEvent.
	ActiveEvent := self.
	^ aBlock ensure: [
		"check to support project switching."
		ActiveEvent == self ifTrue: [ActiveEvent := priorEvent]].