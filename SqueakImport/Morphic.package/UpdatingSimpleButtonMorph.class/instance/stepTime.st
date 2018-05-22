testing
stepTime
	"Answer the desired time between steps in milliseconds.  If the receiver has a wordingProvider that may dynamically provide changed wording for the label, step once every 1.5 seconds"

	^ wordingProvider ifNotNil: [1500] ifNil: [super stepTime]