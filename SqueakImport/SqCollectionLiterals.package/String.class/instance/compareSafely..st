*collections
compareSafely: aString 
	^ aString isString
		ifTrue: [ self < aString ]
		ifFalse: [ super compareSafely: aString ]
