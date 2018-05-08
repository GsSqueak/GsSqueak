printing
print24: hr24 showSeconds: showSeconds showSubseconds: showSubseconds on: aStream 
	"Format is 'hh:mm:ss' or 'h:mm:ss am'  or, if showSeconds is false, 'hh:mm' or 'h:mm am'.
	If showSubseconds is true and our nanoSeconds are not zero, a decimal point and subseconds are added"

	| h m s |
	h := self hour. m := self minute. s := self second.
	hr24
		ifTrue: 
			[ h < 10 ifTrue: [ aStream nextPutAll: '0' ].
			h printOn: aStream ]
		ifFalse:
			[ h > 12
				ifTrue: [h - 12 printOn: aStream]
				ifFalse: 
					[h < 1
						ifTrue: [ 12 printOn: aStream ]
						ifFalse: [ h printOn: aStream ]]].

	aStream nextPutAll: (m < 10 ifTrue: [':0'] ifFalse: [':']).
	m printOn: aStream.

	showSeconds ifTrue:
		[ aStream nextPutAll: (s < 10 ifTrue: [':0'] ifFalse: [':']).
		(showSubseconds not or: [self nanoSecond = 0])
			ifTrue: [s asInteger printOn: aStream]
			ifFalse: [s asInteger * NanosInSecond + self nanoSecond asInteger 
				printOn: aStream asFixedPoint: NanosInSecond]].

	hr24 ifFalse:
		[ aStream nextPutAll: (h < 12 ifTrue: [' am'] ifFalse: [' pm']) ].
