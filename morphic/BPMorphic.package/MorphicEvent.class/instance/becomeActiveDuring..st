initialize
becomeActiveDuring: aBlock 
	"Make the receiver the ActiveEvent during the evaluation of aBlock."
	| _gsSqueakTemp_priorEvent |
	_gsSqueakTemp_priorEvent := ActiveEvent.
	ActiveEvent := self.
	^ aBlock
		ensure: ["check to support project switching."
			ActiveEvent == self
				ifTrue: [ActiveEvent := _gsSqueakTemp_priorEvent]]