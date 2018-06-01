message category functions
highlightMessageList: list with: morphList
	"Changed by emm to add emphasis in case of breakpoint"

	morphList do:[:each | 
		| classOrNil methodOrNil |
		classOrNil := self selectedClassOrMetaClass.
		methodOrNil := classOrNil isNil
			ifTrue:[nil]
			ifFalse:[classOrNil methodDictionary at: each contents ifAbsent:[]].
		(methodOrNil notNil and:[methodOrNil hasBreakpoint])
			ifTrue:[each contents: ((each contents ,' [break]') asText allBold)]]