class initialization
initialize
	"ExternalDropHandler initialize"

	self resetRegisteredHandlers.
	self
		"registerHandler: self defaultImageHandler;" "we have file services for images"
		registerHandler: self defaultGZipHandler;
		registerHandler: self defaultProjectHandler