StandardFileMenu
newFileMenu: aDirectory

	"For compatibility with StandardFileMenu for now, answer a StandardFileMenuResult"
	^(self getFilePathNameDialogWithExistenceCheck)
		resultBlock: self sfmResultBlock;
		directory: aDirectory;
		yourself