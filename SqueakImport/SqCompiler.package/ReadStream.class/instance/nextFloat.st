accessing
nextFloat
	"Read a floating point value from the receiver. This method is highly optimized for cases
	where many floating point values need to be read subsequently. And if this needs to go
	even faster, look at the inner loops fetching the characters - moving those into a plugin
	would speed things up even more."
	| buffer count sign index cc value digit fraction exp startIndex anyDigit digitNeeded |
	buffer := collection.
	count := readLimit.
	index := position+1.

	"Skip separators"
	index := ByteString findFirstInString: buffer inSet: CharacterSet nonSeparators byteArrayMap startingAt: index.
	index = 0 ifTrue:[self setToEnd. ^nil].

	"check for sign"
	digitNeeded := false.
	sign := 1. cc := buffer byteAt: index.
	cc = 45 "$- asciiValue"
		ifTrue:[sign := -1. index := index+1. digitNeeded := true]
		ifFalse:[cc =  43 "$+ asciiValue" ifTrue:[index := index+1. digitNeeded := true]].

	"Read integer part"
	startIndex := index.
	value := 0.
	[index <= count and:[
		digit := (buffer byteAt: index) - 48. "$0 asciiValue"
		digit >= 0 and:[digit <= 9]]] whileTrue:[
			value := value * 10 + digit.
			index := index + 1.
	].
	anyDigit := index > startIndex.
	index > count ifTrue:[
		(digitNeeded and:[anyDigit not]) ifTrue:[^self error: 'At least one digit expected'].
		self setToEnd. ^value asFloat * sign].

	(buffer byteAt: index) = 46 "$. asciiValue" ifTrue:["<integer>.<fraction>"
		index := index+1.
		startIndex := index.
		"NOTE: fraction and exp below can overflow into LargeInteger range. If they do, then things slow down horribly due to the relatively slow LargeInt -> Float conversion. This can be avoided by changing fraction and exp to use floats to begin with (0.0 and 1.0 respectively), however, this will give different results to Float>>readFrom: and it is not clear if that is acceptable here."
		fraction := 0. exp := 1.
		[index <= count and:[
			digit := (buffer byteAt: index) - 48. "$0 asciiValue"
			digit >= 0 and:[digit <= 9]]] whileTrue:[
				fraction := fraction * 10 + digit.
				exp := exp * 10.
				index := index + 1.
		].
		value := value + (fraction asFloat / exp asFloat).
		anyDigit := anyDigit or:[index > startIndex].
	].
	value := value asFloat * sign.

	"At this point we require at least one digit to avoid allowing:
		- . ('0.0' without leading digits)
		- e32 ('0e32' without leading digits) 
		- .e32 ('0.0e32' without leading digits)
	but these are currently allowed:
		- .5 (0.5)
		- 1. ('1.0')
		- 1e32 ('1.0e32')
		- 1.e32 ('1.0e32')
		- .5e32 ('0.5e32')
	"
	anyDigit ifFalse:["Check for NaN/Infinity first"
		(count - index >= 2 and:[(buffer copyFrom: index to: index+2) = 'NaN'])
			ifTrue:[position := index+2. ^Float nan * sign].
		(count - index >= 7 and:[(buffer copyFrom: index to: index+7) = 'Infinity'])
			ifTrue:[position := index+7. ^Float infinity * sign].
		^self error: 'At least one digit expected'
	].

	index > count ifTrue:[self setToEnd. ^value asFloat].

	(buffer byteAt: index) = 101 "$e asciiValue" ifTrue:["<number>e[+|-]<exponent>"
		index := index+1. "skip e"
		sign := 1. cc := buffer byteAt: index.
		cc = 45 "$- asciiValue"
			ifTrue:[sign := -1. index := index+1]
			ifFalse:[cc = 43 "$+ asciiValue" ifTrue:[index := index+1]].
		startIndex := index.
		exp := 0. anyDigit := false.
		[index <= count and:[
			digit := (buffer byteAt: index) - 48. "$0 asciiValue"
			digit >= 0 and:[digit <= 9]]] whileTrue:[
				exp := exp * 10 + digit.
				index := index + 1.
		].
		index> startIndex ifFalse:[^self error: 'Exponent expected'].
		value := value * (10.0 raisedToInteger: exp * sign).
	].

	position := index-1.
	^value