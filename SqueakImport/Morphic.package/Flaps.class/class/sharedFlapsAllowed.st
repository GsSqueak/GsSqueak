shared flaps
sharedFlapsAllowed
	"Answer whether the shared flaps feature is allowed in this system"

	^ SharedFlapsAllowed ifNil: [SharedFlapsAllowed := SharedFlapTabs isEmptyOrNil not]