as yet unclassified
signalFor: characterValue toEncoding: anEncoding

	self new
		unicodeValue: characterValue;
		targetEncoding: anEncoding;
		signal