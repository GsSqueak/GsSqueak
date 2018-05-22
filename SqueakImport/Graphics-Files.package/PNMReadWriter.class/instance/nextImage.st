reading
nextImage
	"read one image"
	| data p |
	first ifNil:[
		first := false.
		data := stream contentsOfEntireFile.
		stream := (RWBinaryOrTextStream with: data) reset.
	]
	ifNotNil:[
		type < 4 ifTrue:[
			self error:'Plain PBM, PGM or PPM have only one image'
		].
	].
	stream ascii.
	p := stream next.
	type := (stream next) asInteger - 48.
	(p = $P and:[type > 0 and:[type < 8]]) ifFalse:[
		self error:'Not a PNM file'
	].
	type = 7 ifTrue:[
		self readHeaderPAM
	]
	ifFalse: [
		self readHeader
	].
	type caseOf: {
		[1] 	->	[^self readPlainBW].
		[2] 	->	[^self readPlainGray].
		[3] 	->	[^self readPlainRGB].
		[4] 	->	[^self readBWreverse: false].
		[5] 	->	[^self readGray].
		[6] 	->	[^self readRGB].
		[7] 	->	[	"PAM"
					(tupleType asUppercase) caseOf: {
						['BLACKANDWHITE'] 		-> [^self readBWreverse: true].
						['GRAYSCALE'] 			-> [^self readGray].
						['RGB'] 					-> [^self readRGB].
						['RGB_ALPHA'] 			-> [^self error:'Not implemented'].
						['GRAYSCALE_ALPHA'] 	-> [^self error:'Not implemented'].
					} otherwise: [^self readData].
				]
	}