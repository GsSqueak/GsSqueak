fileIn/Out
fileOutCategory: catName asHtml: useHtml
	"FileOut the named category, possibly in Html format."
	| internalStream |
	internalStream := WriteStream on: (String new: 1000).
	internalStream header; timeStamp.
	self fileOutCategory: catName on: internalStream moveSource: false toFile: 0.
	internalStream trailer.

	FileStream writeSourceCodeFrom: internalStream baseName: (self name , '-' , catName) isSt: true useHtml: useHtml.