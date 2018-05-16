sources, changes log
systemInformationString
	"Identify software version"
	^ SystemVersion current version, String cr, self lastUpdateString, String cr, self currentChangeSetString

"
	(eToySystem := self at: #EToySystem ifAbsent: [nil]) ifNotNil:
		[aString := aString, '
Squeak-Central version: ', eToySystem version, ' of ', eToySystem versionDate]."