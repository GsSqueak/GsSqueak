squeak protocol
nowAtOffset: offsetDuration
	"Answers the local time at places with the specified offsetDuration timezone."
	"local time Chicago (CST)"
	"DateAndTime nowAtOffset: -6 hours"
	^ self now + (offsetDuration - self localOffset) offset: offsetDuration