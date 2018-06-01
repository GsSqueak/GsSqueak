updating
check: pluginVersion andRequestPluginUpdate: updateURL
	"SystemVersion check: 'zzz' andRequestPluginUpdate: 'http://www.squeakland.org/installers/update.html' "

	"We don't have a decent versioning scheme yet, so we are basically checking for a nil VM version on the mac."
	(self pluginVersion: pluginVersion newerThan: self currentPluginVersion)
		ifFalse: [^true].
	(self confirm: 'There is a newer plugin version available. Do you want to install it now?')
		ifFalse: [^false].
	HTTPClient
		requestURL: updateURL , (Smalltalk platformName copyWithout: Character space) asLowercase , '.html'
		target: '_top'.
	^false