accessing
atRandom: aGenerator
	"Answer a random element of the receiver. Uses aGenerator which
	should be kept by the user in a variable and used every time. Use
	this instead of #atRandom for better uniformity of random numbers because 
	only you use the generator. Causes an error if self has no elements."

	| randomIndex index |
	self emptyCheck.
	randomIndex := aGenerator nextInt: self size.
	index := 1.
	self do: [ :each |
		index = randomIndex ifTrue: [ ^each ].
		index := index + 1 ]