world state
installFlaps
	"Get flaps installed within the bounds of the receiver"
	Project current assureFlapIntegrity.
	self addGlobalFlaps.
	self localFlapTabs
		do: [:aFlapTab | aFlapTab adaptToWorld].
	self assureFlapTabsFitOnScreen.
	self bringTopmostsToFront