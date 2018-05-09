squeak protocol
readFrom: aStream
	"Formatted as per ANSI 5.8.2.16: [-]D:HH:MM:SS[.S]"

	| sign days hours minutes seconds nanos nanosBuffer |
	sign := (aStream peekFor: $-) ifTrue: [-1] ifFalse: [1].
	days := (aStream upTo: $:) asInteger sign: sign.
	hours := (aStream upTo: $:) asInteger sign: sign.
	minutes := (aStream upTo: $:) asInteger sign: sign.
	seconds := (aStream upTo: $.) asInteger sign: sign.
	nanosBuffer := '000000000' copy.
	nanos := WriteStream on: nanosBuffer.
	[aStream atEnd not and: [aStream peek isDigit]]
		whileTrue: [nanos nextPut: aStream next].
		
	^ self 
		days: days 
		hours: hours 
		minutes: minutes 
		seconds: seconds 
		nanoSeconds: (nanosBuffer asInteger sign: sign)

	"	'0:00:00:00' asDuration
		'0:00:00:00.000000001' asDuration
		'0:00:00:00.999999999' asDuration
		'0:00:00:00.100000000' asDuration
		'0:00:00:00.001 ' asDuration
		'0:00:00:00.1' asDuration
		'0:00:00:01 ' asDuration
		'0:12:45:45' asDuration
		'1:00:00:00' asDuration
		'365:00:00:00' asDuration
		'-7:09:12:06.10' asDuration
		'+0:01:02:3' asDuration
 	"