decompiling
decompileWithTemps
	"Return the decompiled parse tree that represents self, but with the temp names obtained
	 either by compiling the sourcecode, or directly if the method has temps in its trailer."

	| class selector tempNames source |
	class := self methodClass ifNil: [Object].
	selector := self selector ifNil: [self defaultSelector].

	self holdsTempNames
		ifTrue: [tempNames := self tempNamesString]
		ifFalse:
			["No source file or no source (e.g. doits) and no temp names
			 -- decompile without temp names "
			((self fileIndex > 0 and: [(SourceFiles at: self fileIndex) isNil])
			or: [(source := self getSourceFromFile) isNil]) ifTrue:
				[^self decompile].
			tempNames := (class newCompiler
									parse: source asString
									in: class
									notifying: nil)
										generate: CompiledMethodTrailer empty;
										schematicTempNamesString].

	^(self decompilerClass new withTempNames: tempNames)
		decompile: selector
		in: class
		method: self methodForDecompile