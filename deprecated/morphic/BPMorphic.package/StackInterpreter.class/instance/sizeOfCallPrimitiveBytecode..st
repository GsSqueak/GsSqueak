compiled methods
sizeOfCallPrimitiveBytecode: methodHeader 
	"Answer the size of the CallPrimitive bytecode that may be used to
	store a method's primitive."
	"NewsqueakV4:	249	11111001	iiiiiiii	jjjjjjjj	Call Primitive #iiiiiiii + (jjjjjjjj *
	256) "
	"SistaV1:		248	11111000 iiiiiiii	mssjjjjj	Call Primitive #iiiiiiii + ( jjjjj * 256)"
	"V3+Closures:	139	11101111	iiiiiiii	jjjjjjjj	Call Primitive #iiiiiiii + (jjjjjjjj * 256)"
	^ objectMemory hasSpurMemoryManagerAPI
		ifTrue: [3]
		ifFalse: [MULTIPLEBYTECODESETS
				ifTrue: [(objectMemory headerIndicatesAlternateBytecodeSet: methodHeader)
						ifTrue: [3]
						ifFalse: [0]]
				ifFalse: [0]]