private
readHeader
	"Set width and height, and position stream at start of bytes"
	| number setwidth setheight fieldName |
	setwidth := setheight := false.
		[((stream atEnd) or: [setwidth and: [setheight]])]
		whileFalse: [
	  	self skipCComments.
		(stream nextMatchAll: '#define ') ifFalse: [^ false].
		(stream skipTo: $_) ifFalse: [^ false].
		fieldName := String streamContents:
			[:source |
			[(stream atEnd) or: [ stream peek isSeparator ]]
				whileFalse: [ source nextPut: stream next]].
	  	(fieldName = 'width') ifTrue: [
			stream skipSeparators.
			number := Integer readFrom: stream.
			(number > 0) ifTrue: [setwidth := true].
	  		width := number.].
		(fieldName = 'height') ifTrue: [
			stream skipSeparators.
			number := Integer readFrom: stream.
			(number > 0) ifTrue: [setheight := true].
			height := number.
			].
		].
	(setwidth & setheight) ifFalse: [^ false].
	^ stream skipTo: ${
