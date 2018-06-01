class initialization
initialize
	"Browser initialize"

	RecentClasses := OrderedCollection new.
	self 
		registerInFlapsRegistry;
		registerInAppRegistry	