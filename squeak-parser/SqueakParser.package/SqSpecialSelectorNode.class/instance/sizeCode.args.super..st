code generation
sizeCode: encoder args: nArgs super: supered 
	"Size a special selector send.
	A super send of a special selector must be handled like a normal send."
	^ supered
		ifTrue: [super
				sizeCode: encoder
				args: nArgs
				super: supered]
		ifFalse: [encoder sizeSendSpecial: code numArgs: nArgs]