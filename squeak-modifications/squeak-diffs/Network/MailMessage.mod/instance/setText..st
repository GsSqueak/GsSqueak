access
setText: aString 

	text := aString withoutTrailingBlanks, String cr, String cr.
	self readFrom: text readStream.
	