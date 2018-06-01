initialization
becomeActiveDuring: aBlock
	"Make the receiver the ActiveHand during the evaluation of aBlock."

	| priorHand |
	priorHand := ActiveHand.
	ActiveHand := self.
	^ aBlock ensure: [
		"check to support project switching."
		ActiveHand == self ifTrue: [ActiveHand := priorHand]].