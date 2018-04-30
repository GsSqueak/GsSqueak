private
cleanupIndex: anInteger
	array at: anInteger put: vacuum.
	tally := tally - 1.
	self fixCollisionsFrom: anInteger.