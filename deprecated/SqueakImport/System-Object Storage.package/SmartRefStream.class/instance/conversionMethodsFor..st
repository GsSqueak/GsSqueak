class changed shape
conversionMethodsFor: classList
	| list |
	"Each of these needs a conversion method.  Hard part is the comment in it.  Return a MessageSet."

	list := OrderedCollection new.
	classList do: [:cls | | oldStruct newStruct |
		oldStruct := structures at: cls name ifAbsent: [#()].
		newStruct := (Array with: cls classVersion), (cls allInstVarNames).
		self writeConversionMethodIn: cls fromInstVars: oldStruct to: newStruct 
				renamedFrom: nil.
		list add: cls name, ' convertToCurrentVersion:refStream:'.
		].

	^list.