instance creation
openOn: aDirectory initialFilename: aString
	"Open a modal dialog to save a file. Start the dialog with aDirectory selected
	and aString as the suggested file name. Note that we set the directory after
	the initialFilename becuase we want a specific directory and not neccesarily 
	the directory of the file."

	"FileSaverDialog openOn: FileDirectory default initialFilename: 'aSuggestedFileName' "

	^self openOn: aDirectory initialFilename: aString label: nil
