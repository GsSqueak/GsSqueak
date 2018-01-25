accessing
at: key put: value
	"Set the value at key to be value."
	
	| index |
	index := self scanFor: key.
	(self basicAt: index)
		ifNil: [
			self
				basicAt: index put: key;
				atNewIndex: index put: value ]
		ifNotNil: [ 
			(array at: index) flushCache.
			array at: index put: value ].
	^value