public access
compile: textOrStream in: aClass notifying: aRequestor ifFail: failBlock 
	"HACK: use the one parse method we support in env0.
	this ignores the notifying/ifFail parameters"

    self flag: #hack.
	^ Compiler new parser _env0 parse: textOrStream class: aClass
