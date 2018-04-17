converting
asIntegerSigned: signed
	"Return the first decimal integer I can find or nil."

	| index character size result negative |
	index := 0.
	size := self size.
	"Find the first character between $0 and $9."
	[ (index := index + 1) > size or: [ (self at: index) isDigit ] ] whileFalse.
	index > size ifTrue: [ ^nil ].
	negative := signed and: [ index > 1 and: [ (self at: index - 1) == $- ] ].
	"Parse the number."
	size - index > 15 ifTrue: [
		negative ifTrue: [ index := index - 1 ].
		^Integer readFrom: (
			ReadStream
				on: self
				from: index
				to: size) ].
	result := (self at: index) digitValue.
	[ (index := index + 1) <= size
		and: [ (character := self at: index) isDigit ] ]  whileTrue: [
		result := result * 10 + character digitValue ].
	negative ifTrue: [ ^result negated ].
	^result