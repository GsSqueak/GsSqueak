code generation
emitCode: stack args: nArgs encoder: encoder super: supered 
	"Generate a special selector send.
	A super send of a special selector must be handled like a normal send."
	supered
		ifTrue: [super
				emitCode: stack
				args: nArgs
				encoder: encoder
				super: supered]
		ifFalse: [stack pop: nArgs.
			encoder genSendSpecial: code numArgs: nArgs]