initialize-release
initialize

	super initialize.
	showDirsInFileList := false.
	fileSelectionBlock := [ :entry :myPattern |
		entry isDirectory ifTrue: [
			showDirsInFileList
		] ifFalse: [
			myPattern = '*' or: [myPattern match: entry name]
		]
	].
	dirSelectionBlock := [ :dirName | true].