query assembly
codeReferencingUser

	^ '(AllUsers userWithId: ' , self username storeString , ' ifAbsent: [nil])'