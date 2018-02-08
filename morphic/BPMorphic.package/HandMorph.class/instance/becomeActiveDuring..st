initialization
becomeActiveDuring: aBlock 
	"Make the receiver the ActiveHand during the evaluation of aBlock."
	| _gsSqueakTemp_priorHand |
	_gsSqueakTemp_priorHand := ActiveHand.
	ActiveHand := self.
	^ aBlock
		ensure: ["check to support project switching."
			ActiveHand == self
				ifTrue: [ActiveHand := _gsSqueakTemp_priorHand]]