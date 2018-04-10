-Etoys-card in a stack
stackDo: aBlock 
	"If the receiver has a stack, evaluate aBlock on its behalf"
	(self ownerThatIsA: StackMorph)
		ifNotNil: [:_gsSqueakTemp_aStack | ^ aBlock value: _gsSqueakTemp_aStack]