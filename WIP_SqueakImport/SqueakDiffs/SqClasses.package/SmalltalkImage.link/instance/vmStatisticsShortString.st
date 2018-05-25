vm statistics
vmStatisticsShortString
	"Convenience item for access to recent statistics only"
	"StringHolderView open: (StringHolder new contents: Smalltalk vmStatisticsShortString)
		label: 'VM Recent Statistics'"

	^ (ReadStream on: self vmStatisticsReportString) upToAll: 'Since'; nextLine; upToEnd
