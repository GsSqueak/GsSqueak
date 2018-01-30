source code management
getSourceFor: selector in: class
	"Retrieve or reconstruct the source code for this method."
	| trailer source |
	(self properties includesKey: #source) ifTrue:
		[^self properties at: #source].
	trailer := self trailer.

	trailer tempNames ifNotNil: [:namesString | 
		"Magic sources -- decompile with temp names"
		^ ((class decompilerClass new withTempNames: namesString)
				decompile: selector in: class method: self methodForDecompile)
			decompileString].
	
	trailer sourceCode ifNotNil: [:code | ^ code ].
	
	trailer hasSourcePointer ifFalse: [
		"No source pointer -- decompile without temp names"
		^ (class decompilerClass new decompile: selector in: class method: self methodForDecompile)
			decompileString].

	"Situation normal;  read the sourceCode from the file"
	source := [self getSourceFromFileAt: trailer sourcePointer]
				on: Error
		"An error can happen here if, for example, the changes file has been truncated by an aborted download.  The present solution is to ignore the error and fall back on the decompiler.  A more thorough solution should probably trigger a systematic invalidation of all source pointers past the end of the changes file.  Consider that, as time goes on, the changes file will eventually grow large enough to cover the lost code, and then instead of falling into this error case, random source code will get returned."
				do: [ :ex | ex return: nil].
		
	^source ifNil: [
			"Something really wrong -- decompile blind (no temps)"
			 (class decompilerClass new decompile: selector in: class method: self methodForDecompile)
				decompileString]