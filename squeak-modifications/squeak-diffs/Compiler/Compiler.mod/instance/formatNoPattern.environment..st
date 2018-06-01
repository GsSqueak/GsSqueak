public access
formatNoPattern: textOrStream environment: env
	"Pretty-print a code snippet. Removes leading 'DoIt' and the '^' in the last statement. To be used in workspace-like tools."
	
	| aNode |

	self flag: #'hack'.
	self halt.
	self setCue: (CompilationCue
		source: textOrStream
		environment: env).
		
	aNode := self formatNoPattern: true ifFail: [^ nil].

	^ (aNode decompileString lines allButFirst "DoIt" collect: [:ea |
		ea allButFirst "tab" in: [:result | (result beginsWith: '^ ') ifTrue: [result allButFirst: 2] ifFalse: [result]]])
			joinSeparatedBy: String cr