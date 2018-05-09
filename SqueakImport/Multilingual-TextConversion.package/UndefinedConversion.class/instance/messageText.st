private
messageText
	"Return a textual description of the exception."
	^messageText ifNil: [
		'Can not represent the unicode character ' , (self unicodeValue printStringRadix: 16) , ' in ' , self targetEncoding encodingNames first]