query assembly
codeReferencingUser

	^ '(AllUsers userWithId: ' , self username printString , ' ifAbsent: [nil])'