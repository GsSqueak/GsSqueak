accessing
lastSelDir
	"Return the last selected directory or the default directory if no directory was selected so far."

	^lastSelDir ifNil: [ lastSelDir := FileDirectory default ]