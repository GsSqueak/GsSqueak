utilities
compileNewDefaultBackgroundFrom: aForm 
	"Compile a new #defaultBackgroundForm method in this class-side which uses aForm as the background."
	| formStream base64 |
	formStream := ByteArray new writeStream.
	PNGReadWriter
		putForm: aForm
		onStream: formStream.
	base64 := formStream base64Encoded.
	self class
		compile:
			(String streamContents:
				[ : stream | stream
					 nextPutAll: 'defaultBackgroundForm
	^ Form fromBinaryStream: ' ;
					 nextPut: $' ;
					 nextPutAll: base64 ;
					 nextPut: $' ;
					nextPutAll: ' base64Decoded asByteArray readStream' ])
		classified: 'class initialization'