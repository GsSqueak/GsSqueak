objects from disk
objectForDataStream: refStrm
	"I am about to be written on an object file.  If I am a global flap, write a proxy instead."

	| dp |
	self isGlobalFlap ifTrue:
		[dp := DiskProxy global: #Flaps selector: #globalFlapTabOrDummy: 
					args: {self flapID}.
		refStrm replace: self with: dp.
		^ dp].

	^ super objectForDataStream: refStrm