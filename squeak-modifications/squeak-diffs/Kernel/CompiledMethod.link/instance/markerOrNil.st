private
markerOrNil
	"If I am a marker method, answer the symbol used to mark me.  Otherwise
	 answer nil. What is a marker method?  It is method with body like 
		'self subclassResponsibility' or '^ self subclassResponsibility' 
	used to indicate ('mark') a special property."

	^self encoderClass markerOrNilFor: self