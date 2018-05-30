message functions
messageListMenuForRecentSubmission: aMenu
	<messageListMenuShifted: false>
	aMenu addList:#(
			('remove from RecentSubmissions'		removeFromRecentSubmissions)).
	^ aMenu