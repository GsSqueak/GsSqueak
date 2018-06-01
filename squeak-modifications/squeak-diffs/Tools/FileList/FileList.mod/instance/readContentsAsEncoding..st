private
readContentsAsEncoding: encodingName
	| f writeStream converter c |
	f := directory oldFileOrNoneNamed: self fullName.
	f ifNil: [^ 'For some reason, this file cannot be read'].
	writeStream := WriteStream on: String new.
	converter := TextConverter defaultConverterClassForEncoding: encodingName.
	converter ifNil: [^ 'This encoding is not supported'].
	f converter: converter new.
	f wantsLineEndConversion: true.
	[f atEnd or: [(c := f next) isNil]]
		whileFalse: [writeStream nextPut: c].
	f close.
	^ writeStream contents