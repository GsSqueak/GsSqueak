as yet unclassified
backgroundWorldDisplay

	| world |
	self flag: #bob.		"really need a better way to do this"

			"World displayWorldSafely."

	"ugliness to try to track down a possible error"

	world := Project current world.
	[world displayWorld] ifError: [ :a :b |
		| f |
		stageCompleted := 999.
		f := FileDirectory default fileNamed: 'bob.errors'.
		f nextPutAll: a printString,'  ',b printString; cr; cr.
		f nextPutAll: 'worlds equal ',(formerWorld == world) printString; cr; cr.
		f nextPutAll: thisContext longStack; cr; cr.
		f nextPutAll: formerProcess suspendedContext longStack; cr; cr.
		f close. Beeper beep.
	].
