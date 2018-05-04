instance creation
newFrom: aCollection
	"Compress aCollection into a ShortRunArray"
	| lastValue lastRun runs values |
	aCollection isEmpty ifTrue:[^self runs:#() values: #()].
	runs := WriteStream on: (WordArray new: 100).
	values := WriteStream on: (ShortIntegerArray new: 100).
	lastValue := aCollection first.
	lastRun := 0.
	aCollection do:[:item|
		(item = lastValue and:[lastRun < 16r8000]) ifTrue:[
			lastRun := lastRun + 1.
		] ifFalse:[
			runs nextPut: lastRun.
			values nextPut: lastValue.
			lastRun := 1.
			lastValue := item.
		].
	].
	runs nextPut: lastRun.
	values nextPut: lastValue.
	^self runs: runs contents values: values contents