printing
printOn: aStream asFixedPoint: base
	"assume I am a fixedpoint decimal scaled by base"
	"String streamContents: [:s | 1234 printOn: s asFixedPoint: 1000]"

	| b n |
	self < 0 ifTrue: [aStream nextPut: $-. 
		^self negated printOn: aStream asFixedPoint: base].
	b := base.
	n := self.
	[aStream print: n // b.
	(n := n \\ b) = 0] whileFalse: [
		b = base ifTrue: [aStream nextPut: $.].
		b := b // 10].
