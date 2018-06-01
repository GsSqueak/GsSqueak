file list
updateFileList
	"Update my files list with file names in the current directory that match the patternList."

		Cursor wait
			showWhile: [self listForPatterns: patternList.
				listIndex := 0.
				self changed: #fileList]