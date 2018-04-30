fileIn/Out
objectForDataStream: refStream
	| prj repl |
	prj := refStream project.
	prj ifNil:[^super objectForDataStream: refStream].
	ResourceCollector current ifNil:[^super objectForDataStream: refStream].
	repl := ResourceCollector current objectForDataStream: refStream fromForm: self.
	^repl