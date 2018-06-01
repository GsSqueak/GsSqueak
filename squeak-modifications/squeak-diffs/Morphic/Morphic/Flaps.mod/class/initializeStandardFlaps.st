predefined flaps
initializeStandardFlaps
	"Initialize the standard default out-of-box set of global flaps. This method creates them and places them in my class variable #SharedFlapTabs, but does not itself get them displayed."

	SharedFlapTabs := nil.
	self addStandardFlaps