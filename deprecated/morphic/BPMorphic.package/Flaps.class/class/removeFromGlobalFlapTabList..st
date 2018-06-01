miscellaneous
removeFromGlobalFlapTabList: aFlapTab 
	"If the flap tab is in the global list, remove it"
	SharedFlapTabs
		remove: aFlapTab
		ifAbsent: []