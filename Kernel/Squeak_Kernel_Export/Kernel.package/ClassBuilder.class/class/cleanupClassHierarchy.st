cleanup obsolete classes
cleanupClassHierarchy
	"Makes the class hierarchy consistent and removes obsolete classes from the SystemDictionary."
	self informUserDuring:[:bar|
		self cleanupClassHierarchy: bar.
	].