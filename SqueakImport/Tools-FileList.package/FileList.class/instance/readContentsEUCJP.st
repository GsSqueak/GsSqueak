private
readContentsEUCJP
	| f writeStream |
	f := directory oldFileOrNoneNamed: self fullName.
	f ifNil: [^ 'For some reason, this file cannot be read'].
	writeStream := WriteStream on: String new.
	f converter: EUCJPTextConverter new.
	[f atEnd]
		whileFalse: [writeStream nextPut: f next].
	f close.
	^ writeStream contents