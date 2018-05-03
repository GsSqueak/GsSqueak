translation
translateInDirectory: directory doInlining: inlineFlag
"handle a special case code string rather than generated code"
"Not currently hooked into the timeStamp mechanism for VMMaker since this would mean replicating code from InterpreterPlugin; waiting for a more elegant solution to appear. In the meantime this means that this plugin will always get regenerated even if the file is uptodate"
	| cg aClass |
	self initialize.

	cg := self buildCodeGenerator.
	aClass := Smalltalk at: #ADPCMCodec ifAbsent:[nil].
	aClass ifNil:[
		Transcript cr; show: 'ADPCMCodec not present in image. Skipping plugin.'.
		^self].

	cg addMethodsForPrimitives: aClass translatedPrimitives.
	inlineFlag ifTrue:[
		"now remove a few which will be inlined but not pruned"
		cg pruneMethods: #(indexForDeltaFrom:to: nextBits: nextBits:put:)].
	self storeString: cg generateCodeStringForPrimitives onFileNamed: (directory fullNameFor: self moduleFileName).
	^cg exportedPrimitiveNames asArray
