generate sources
generateEntire
"generate the interp, internal plugins and exports as well as the external plugins"

	self generateMainVM.
	self deleteUnwantedExternalPluginDirectories.
	self generateExternalPlugins.
	self generateUtilityPrograms
