message list
decompiledSourceIntoContentsWithTempNames: showTempNames 
	"Obtain a source string by decompiling the method's code, and place 
	that source string into my contents.
	Also return the string.
	Get temps from source file if showTempNames is true."

	| class selector method |
	class := self selectedClassOrMetaClass.
	selector := self selectedMessageName.
	"Was method deleted while in another project?"
	method := class compiledMethodAt: selector ifAbsent: [^ ''].

	currentCompiledMethod := method.
	contents := (showTempNames
		ifTrue: [method decompileWithTemps]
		ifFalse: [method decompile]) decompileString.
	contents := contents asText makeSelectorBoldIn: class.
	^ contents copy