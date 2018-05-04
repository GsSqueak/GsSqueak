prime numbers
verbosePrimesUpTo: max do: aBlock
	"Integer verbosePrimesUpTo: SmallInteger maxVal" "<- heh, heh"
	"Compute primes up to max, but be verbose about it"
	| lastTime |
	lastTime := Time millisecondClockValue.
	UIManager default informUserDuring:[:bar|
		bar value:'Computing primes...'.
		self primesUpTo: max do:[:prime| | nowTime |
			aBlock value: prime.
			nowTime := Time millisecondClockValue.
			(nowTime - lastTime > 1000) ifTrue:[
				lastTime := nowTime.
				bar value:'Last prime found: ', prime printString]]].