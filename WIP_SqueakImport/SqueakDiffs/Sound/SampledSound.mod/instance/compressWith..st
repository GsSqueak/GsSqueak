accessing
compressWith: codecClass 
	| codec result |
	codec := codecClass new.
	result := codec compressSound: self.
	codec release.
	^ result