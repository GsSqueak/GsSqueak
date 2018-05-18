testing
wantsSteps
	"Answer whether the receiver wishes to be sent the #step message.  In the current case, this decision depends on whether there is a wordingProvider which can dynamically provide fresh wording for the button's label"

	^ wordingProvider notNil