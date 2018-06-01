private-encoding
writeHeader

	| byte |
	stream position = 0 ifTrue: [
		"For first image only"
		self
			nextPutAll: #[71 73 70 56 57 97]; "'GIF89a' asByteArray"
			writeWord: width; "Screen Width"
			writeWord: height.	"Screen Height"
		byte := 16r80.  "has color map"
		byte := byte bitOr: ((bitsPerPixel - 1) bitShift: 5).  "color resolution"
		byte := byte bitOr: bitsPerPixel - 1.  "bits per pixel"
		self 
			nextPut: byte;
			nextPut: 0;		"background color."
			nextPut: 0.		"reserved"
		colorPalette do: [:pixelValue |
			self	nextPut: ((pixelValue bitShift: -16) bitAnd: 255);
				nextPut: ((pixelValue bitShift: -8) bitAnd: 255);
				nextPut: (pixelValue bitAnd: 255)].
		loopCount ifNotNil: [
			"Write a Netscape loop chunk"
			self 
				nextPut: Extension;
				nextPutAll: #[255 11 78 69 84 83 67 65 80 69 50 46 48 3 1];
				writeWord: loopCount;
				nextPut: 0]].

	(delay notNil and: [ transparentIndex notNil ]) ifTrue: [
		self nextPut: Extension;
			nextPutAll: #[16rF9 4];
			nextPut: (transparentIndex ifNil: [0] ifNotNil: [9]);
			writeWord: (delay ifNil: [0] ifNotNil: [delay]);
			nextPut: (transparentIndex ifNil: [0] ifNotNil: [transparentIndex]);
			nextPut: 0].

	self
		nextPut: ImageSeparator;
		writeWord: 0;		"Image Left"
		writeWord: 0;		"Image Top"
		writeWord: width;	"Image Width"
		writeWord: height.	"Image Height"
	byte := interlace ifTrue: [16r40] ifFalse: [0].
	self nextPut: byte.
