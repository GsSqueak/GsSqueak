class initialization
initialize
	"HTTPSocket initialize"

	HTTPPort := 80.
	self httpProxyServer: nil.
	HTTPBlabEmail := ''.  "	'From: somebody@no.where', CrLf	"
	HTTPProxyCredentials := ''.

	ExternalSettings registerClient: self.
	self removeHTTPProxyPreferences.