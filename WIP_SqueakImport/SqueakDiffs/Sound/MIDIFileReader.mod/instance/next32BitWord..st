private
next32BitWord: msbFirst
	"Read a 32-bit positive integer from the input stream."
	"Assume: Stream has at least four bytes left."

	| n |
	n := stream next: 4.
	^msbFirst
		ifTrue:[((n at: 1) bitShift: 24) + ((n at: 2) bitShift: 16) + ((n at: 3) bitShift: 8) + (n at: 4)]
		ifFalse:[((n at: 4) bitShift: 24) + ((n at: 3) bitShift: 16) + ((n at: 2) bitShift: 8) + (n at: 1)]
