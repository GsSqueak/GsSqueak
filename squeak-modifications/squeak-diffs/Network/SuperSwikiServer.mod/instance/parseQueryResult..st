testing
parseQueryResult: resultStream

	| projectInfos projectName  downloadUrl |
	projectInfos := OrderedCollection new.
	downloadUrl := self downloadUrl.
	resultStream reset; nextLine.
	[resultStream atEnd] whileFalse: [
		projectName := resultStream nextLine.
		projectInfos add: projectName.
		"Transcript show: projectName; cr."
		].
	"Transcript show: 'done'; cr."
	^projectInfos
