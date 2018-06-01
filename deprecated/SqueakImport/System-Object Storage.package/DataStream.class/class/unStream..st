as yet unclassified
unStream: aString

	^(self on: ((RWBinaryOrTextStream with: aString) reset; binary)) next