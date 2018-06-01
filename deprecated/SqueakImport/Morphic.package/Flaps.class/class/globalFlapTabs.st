shared flaps
globalFlapTabs
	"Answer the list of shared flap tabs, creating it if necessary.  Much less aggressive is #globalFlapTabsIfAny"

	SharedFlapTabs ifNil: [self initializeStandardFlaps].
	^ SharedFlapTabs copy