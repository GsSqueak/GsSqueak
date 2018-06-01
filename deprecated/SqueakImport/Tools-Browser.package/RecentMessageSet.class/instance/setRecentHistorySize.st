message list
setRecentHistorySize
	"Let the user specify the recent history size"

	| aReply aNumber |
	aReply := UIManager default request: 'How many recent methods
should be maintained?' initialAnswer: RecentMessages numberOfRecentSubmissionsToStore asString.
	aReply isEmptyOrNil ifFalse:
		[aNumber := aReply asNumber rounded.
		(aNumber > 1 and: [aNumber <= 1000])
			ifTrue:
				[RecentMessages numberOfRecentSubmissionsToStore: aNumber.
				self inform: 'Okay, ', aNumber asString, ' is the new size of the recent method history']
			ifFalse:
				[self inform: 'Sorry, must be a number between 2 & 1000']]