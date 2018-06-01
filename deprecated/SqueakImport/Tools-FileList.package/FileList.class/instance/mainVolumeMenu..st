volume menu
mainVolumeMenu: aMenu
	<volumeMenu>
	^ aMenu addTranslatedList: #(
			('recent...'				recentDirs)
			-
			('add server...'			askServerInfo)
			('remove server...'		removeServer)
			-
			('delete directory...'		deleteDirectory)
			-);
		yourself