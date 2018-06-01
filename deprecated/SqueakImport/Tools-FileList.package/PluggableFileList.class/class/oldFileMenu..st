StandardFileMenu
oldFileMenu: aDirectory

	"For compatibility with StandardFileMenu for now, answer a StandardFileMenuResult"
	^(self getFilePathNameDialog)
		resultBlock: self sfmResultBlock;
		directory: aDirectory;
		yourself