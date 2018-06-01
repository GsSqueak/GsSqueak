private
encode: squeakEncodedCharCode
	"Answer the encoded byte code corresponding to squeakEncodedCharCode.
	Note that the squeakEncodedCharCode does not necessary span in the range 0...255."
	^ self class encodeTable at: squeakEncodedCharCode 
		ifAbsent: [UndefinedConversion signalFor: squeakEncodedCharCode toEncoding: self ]