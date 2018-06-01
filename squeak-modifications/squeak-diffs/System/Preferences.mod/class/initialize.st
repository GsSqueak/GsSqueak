class initialization
initialize
	"Dictionary is nil on GsSqueak bootstrap. initialize it"
	self initializeDictionaryOfPreferences.
	self initializeParameters.
    
	"Preferences initialize"
	self registerForEvents.

