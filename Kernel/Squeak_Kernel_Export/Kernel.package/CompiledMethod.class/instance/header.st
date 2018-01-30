literals
header
	"Answer the word containing the information about the form of the 
	 receiver and the form of the context needed to run the receiver.
	 There are two different formats, selected by the sign bit.  These are

	 Original Squeak V3:
		30:sign:0 29:flag 28:prim (high bit) 27-24:numArgs 23-18:numTemps 17:largeFrameFlag 16-9:numLits 8-0:prim (low 9 bits)

	 Alternate Bytecode Set
		30:sign:1 29-28:accessModifier 27-24:numArgs 23-18:numTemps 17:largeFrameFlag 16:hasPrimitive 15-0:numLits

	 i.e. the Alternate Bytecode Set expands the number of literals to 65535 by assuming a CallPrimitive bytecode."

	^self objectAt: 1