docking bars support
showWorldMainDockingBar: aBoolean 
	"Change the receiver to show the main docking bar"
	self projectPreferenceFlagDictionary at: #showWorldMainDockingBar put: aBoolean.
	self assureMainDockingBarPresenceMatchesPreference