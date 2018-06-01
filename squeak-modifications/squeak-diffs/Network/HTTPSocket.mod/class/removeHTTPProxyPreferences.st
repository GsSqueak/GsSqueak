proxy settings
removeHTTPProxyPreferences
	" This method will remove the old HTTP Proxy preferences. "
	(Preferences valueOfPreference: #httpProxyServer) ifNotNil:[
		HTTPProxyServer := Preferences valueOfPreference: #httpProxyServer.
		Preferences removePreference: #httpProxyServer.
	].
	(Preferences valueOfPreference: #httpProxyPort) ifNotNil:[
		HTTPProxyPort := Preferences valueOfPreference: #httpProxyPort.
		Preferences removePreference: #httpProxyPort.
	].
