-Etoys-card in a stack
newCard
	"Create a new card for the receiver and return it"
	| _gsSqueakTemp_aNewInstance |
	self isStackBackground
		ifFalse: [^ Beeper beep].
	"bulletproof against deconstruction"
	_gsSqueakTemp_aNewInstance := self player class baseUniclass new.
	^ _gsSqueakTemp_aNewInstance