instance creation
newForEncoding: aString 
	| class encoding |
	aString ifNil: [^ ISO88591TextConverter new].
	encoding := aString asLowercase.
	class := self allSubclasses
				detect: [:each | each encodingNames includes: encoding]
				ifNone: [].
	class isNil
		ifTrue: [NoConverterFound signalFor: aString. ^ nil].
	^ class new