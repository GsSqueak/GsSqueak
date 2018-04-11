shared flaps
addGlobalFlap: aFlapTab 
	"Add the given flap tab to the list of shared flaps"
	SharedFlapTabs
		ifNil: [SharedFlapTabs := OrderedCollection new].
	SharedFlapTabs add: aFlapTab