class changed shape
storeInstVarsIn: anObject from: dict
	"For instance variables with the same names, store them in the new instance.  Values in variable-length part also.  This is NOT the normal inst var transfer!  See Object.readDataFrom:size:.  This is for when inst var names have changed and some additional conversion is needed.  Here we handle the unchanged vars.  "

	(anObject class allInstVarNames) doWithIndex: [:varName :index |
		(dict includesKey: varName) ifTrue: [
			anObject instVarAt: index put: (dict at: varName)]].
	"variable part"
	(dict includesKey: #SizeOfVariablePart) ifFalse: [^ anObject].
	1 to: (dict at: #SizeOfVariablePart) do: [:index | 
		anObject basicAt: index put: (dict at: index)].
	^ anObject