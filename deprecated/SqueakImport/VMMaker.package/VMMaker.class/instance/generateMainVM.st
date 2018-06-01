generate sources
generateMainVM
"generate the interp, internal plugins and exports"

	self generateInterpreterFile;
		processFilesForCoreVM;
		processAssortedFiles;
		deleteUnwantedInternalPluginDirectories;
		generateInternalPlugins;
		generateExportsFile