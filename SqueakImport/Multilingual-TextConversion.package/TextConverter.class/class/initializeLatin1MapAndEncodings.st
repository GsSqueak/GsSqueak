accessing
initializeLatin1MapAndEncodings
	"Initialize the latin1Map and latin1Encodings.
	These variables ensure that conversions from latin1 ByteString is reasonably fast"
	
	latin1Map := ByteArray new: 256.
	latin1Encodings := Array new: 256.
	0 to: 255 do:[:i |
		| latin1 encoded |
		latin1 := String with: (Character value: i).
		[encoded := String with: (Character value: (self new encode: latin1 first charCode))] 
			ifError: [].
		latin1 = encoded ifTrue:[
			latin1Map at: i+1 put: 0. "no translation needed"
		] ifFalse: [
			latin1Map at: i+1 put: 1. "translation needed"
			latin1Encodings at: i+1 put: encoded.
		]].