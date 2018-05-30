accessing
compressWith: codecClass atRate: aSamplingRate 
	| codec result |
	codec := codecClass new.
	result := codec compressSound: self atRate: aSamplingRate.
	codec release.
	^ result