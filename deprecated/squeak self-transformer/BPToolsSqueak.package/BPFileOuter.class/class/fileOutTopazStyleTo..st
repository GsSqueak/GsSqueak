as yet unclassified
fileOutTopazStyleTo: aStream
	aStream nextPutAll: self topazHead.
	aStream nextPutAll: self topazClassDefinition.
	self methodDict keysDo: [ :each |
		aStream nextPutAll: (self topazMethodDefinition: each)].
	aStream nextPutAll: self topazTail.