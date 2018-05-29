converting
asIntegerSigned: signed
	"Return the first decimal integer I can find or nil."

	| index integerValue result size negative |
	(size := self size) <= 16 ifFalse: [ ^super asIntegerSigned: signed ].
	"Find the first character between $0 and $9."
	index := 0.
	[ 
		(index := index + 1) <= size ifFalse: [ ^nil "There are no digits in this string." ].
		(integerValue := self basicAt: index) <= 47 "$0 asInteger - 1"
			or: [ 58 "$9 asInteger + 1" <= integerValue ] ] whileTrue.
	"Check the sign."
	negative := signed and: [ 2 <= index and: [ (self at: index - 1) == $- ] ].
	"Parse the number."
	result := integerValue - 48 "$0 asInteger".
	[ (index := index + 1) <= size
		and: [ (integerValue := self basicAt: index) <= 57 "$9 asInteger"
		and: [ 48 "$0 asInteger" <= integerValue ] ] ]  whileTrue: [
		result := result * 10 + integerValue - 48 ].
	negative ifTrue: [ ^result negated ].
	^result
