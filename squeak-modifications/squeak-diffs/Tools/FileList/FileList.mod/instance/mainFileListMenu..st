file list menu
mainFileListMenu: aMenu
	<fileListMenu>
	fileName
		ifNil: [^ self noFileSelectedMenu: aMenu]
		ifNotNil: [^ self fileSelectedMenu: aMenu].
