squeak protocol
floor
	"Answer a copy with magnitude rounded down to the nearest whole second"
	^self class basicNew
		ticks: (self ticks at: 3 put: 0; yourself)
		offset: offset.
