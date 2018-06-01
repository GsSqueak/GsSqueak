class initialization
initialize
	"self initialize"
	
	Locale addLocalChangedListener: self.
	self updateInstances.