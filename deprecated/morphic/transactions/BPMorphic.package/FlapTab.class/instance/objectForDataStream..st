objects from disk
objectForDataStream: refStrm 
	"I am about to be written on an object file. If I am a global flap, write a
	proxy instead."
	| _gsSqueakTemp_dp |
	self isGlobalFlap
		ifTrue: [_gsSqueakTemp_dp := DiskProxy
						global: #Flaps
						selector: #globalFlapTabOrDummy:
						args: {self flapID}.
			refStrm replace: self with: _gsSqueakTemp_dp.
			^ _gsSqueakTemp_dp].
	^ super objectForDataStream: refStrm