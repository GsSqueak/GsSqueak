private
compileCue: aCue noPattern: aBoolean ifFail: failBlock 
	"Answer a MethodNode corresponding to cue source.
	If the MethodNode can not be created, notify the cue requestor.
	If the cue requestor is nil, evaluate failBlock instead.
	The MethodNode is the root  of a parse tree.
	It can be told to generate a CompiledMethod
	- either to be evaluated in cue context if aBoolean is true, with cue receiver as method receiver,
	- or to be installed in the method dictionary of the target class specified by the cue if aBoolean is false."
	
	self setCue: aCue.
	^self translateNoPattern: aBoolean	ifFail: failBlock