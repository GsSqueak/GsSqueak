private
bitLengths: blArray codes: codeArray
	bitLengths := blArray as: WordArray.
	codes := codeArray as: WordArray.
	self assert:[(self bitLengthAt: maxCode) > 0].