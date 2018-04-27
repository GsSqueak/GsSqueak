fileIn/Out
fileOutCategory: category asHtml: useHtml
	"FileOut all the classes in the named system category."
	| internalStream |
	internalStream := WriteStream on: (String new: 1000).
	self fileOutCategory: category on: internalStream initializing: true.

	FileStream writeSourceCodeFrom: internalStream baseName: category isSt: true useHtml: useHtml.
