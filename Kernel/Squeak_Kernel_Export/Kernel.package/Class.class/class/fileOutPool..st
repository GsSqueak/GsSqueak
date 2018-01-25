fileIn/Out
fileOutPool: aString
	"file out the global pool named aString"
	
	| internalStream |
	internalStream := WriteStream on: (String new: 1000).
	self new fileOutPool: (self environment at: aString asSymbol) onFileStream: internalStream.

	FileStream writeSourceCodeFrom: internalStream baseName: aString isSt: true useHtml: false.