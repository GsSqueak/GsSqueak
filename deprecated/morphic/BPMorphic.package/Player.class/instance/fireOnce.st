scripts-execution
fireOnce
	"If the receiver has any script armed to be triggered on mouse down
	and/or mouse-up, run those scripts now -- first the mouseDown ones,
	then the mouseUp ones."
	self
		instantiatedUserScriptsDo: [:aScriptInst | aScriptInst status == #mouseDown
				ifTrue: [aScriptInst fireOnce]].
	self
		instantiatedUserScriptsDo: [:aScriptInst | aScriptInst status == #mouseUp
				ifTrue: [aScriptInst fireOnce]]