public access
compile: aCue ifFail: failBlock 
	"Answer a MethodNode. If the MethodNode can not be created, notify 
	the requestor in the contxt. If the requestor is nil, evaluate failBlock 
	instead. The MethodNode is the root  of a parse tree. It can be told 
	to generate a CompiledMethod to be installed in the method dictionary 
	of the class specified by the context."
	
	^self
		compileCue: aCue
		noPattern: false
		ifFail: failBlock 