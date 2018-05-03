translation
declareCVarsIn: aCCodeGenerator
	aCCodeGenerator var: #memory type:#'usqInt'.
	aCCodeGenerator
		var: #remapBuffer
		declareC: 'sqInt remapBuffer[', (RemapBufferSize + 1) printString, ']'.
	aCCodeGenerator
		var: #rootTable
		declareC: 'sqInt rootTable[', (RootTableSize + 1) printString, ']'.
	"Weak roots must be large enough for roots+remapBuffer+sizeof(allCallsOn: #markAndTrace:)"
	aCCodeGenerator
		var: #weakRoots
		declareC: 'sqInt weakRoots[', (RootTableSize + RemapBufferSize + 100) printString, ']'.
	aCCodeGenerator
		var: #extraRoots
		declareC: 'sqInt* extraRoots[', (ExtraRootSize + 1) printString, ']'.
	aCCodeGenerator
		var: #headerTypeBytes
		declareC: 'sqInt headerTypeBytes[4]'.
	
	self declareCAsOop: {
			#youngStart .
			#endOfMemory .
			#memoryLimit .
			#youngStartLocal .
			#freeBlock .
			#compStart .
			#compEnd .
			#fwdTableNext .
			#fwdTableLast .
			#gcBiasToGrowThreshold .
			#shrinkThreshold .
			#growHeadroom }
		in: aCCodeGenerator
