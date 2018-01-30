initialization
seed: anIntegerOrNil
	"Use the given integer as the seed, or generate one if it's nil."

	| newSeed |
	newSeed := anIntegerOrNil ifNil:
					[(Time utcMicrosecondClock bitShift: 28) bitXor: self hash hashMultiply].
	(newSeed between: 0 and: 16rFFFFFFFF) ifFalse:
		[newSeed := self hashSeed: newSeed].
	self 
		initializeStatesWith: newSeed;
		generateStates