filtering
filterToCurrentAuthor
	"Filter down only to messages with my initials as most recent author"
	self filterFrom:
		[:aClass :aSelector | | aMethod aTimeStamp |
			(aClass notNil and: [aSelector notNil]) and:			
				[aMethod := aClass compiledMethodAt: aSelector ifAbsent: [nil].
				aMethod notNil and:
					[(aTimeStamp := aMethod timeStamp) notNil and:
						[aTimeStamp beginsWith: Utilities authorInitials]]]]