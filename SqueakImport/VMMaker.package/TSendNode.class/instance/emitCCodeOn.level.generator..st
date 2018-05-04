C code generation
emitCCodeOn: aStream level: level generator: aCodeGen
	"Emit the receiver as a statement."

	"If the selector is a built-in construct, translate it and return"
	(self isExpression
			ifFalse: [aCodeGen emitBuiltinConstructFor: self on: aStream level: level]
			ifTrue: [aCodeGen emitBuiltinConstructAsArgumentFor: self on: aStream level: level])
		ifFalse:
			["If it is a pointer dereference generate it"
			(self emitCCodeAsPointerDereferenceOn: aStream level: level generator: aCodeGen) ifFalse:
				["Otherwise generate the vanilla C function call."
				 self emitCCodeAsFunctionCallOn: aStream level: level generator: aCodeGen]]