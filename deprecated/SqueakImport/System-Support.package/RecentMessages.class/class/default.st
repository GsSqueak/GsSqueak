accessing
default
	^ Default ifNil: [Default := RecentMessages newRemembering: self numberOfRecentSubmissionsToStore].