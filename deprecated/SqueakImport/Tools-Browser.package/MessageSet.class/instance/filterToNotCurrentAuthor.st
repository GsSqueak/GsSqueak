filtering
filterToNotCurrentAuthor
	"Filter down only to messages not stamped with my initials"
	self filterFrom:
		[:aClass :aSelector | | aTimeStamp aMethod |
			(aClass notNil and: [aSelector notNil]) and:			
				[aMethod := aClass compiledMethodAt: aSelector ifAbsent: [nil].
				aMethod notNil and:
					[(aTimeStamp := aMethod timeStamp) isNil or:
						[(aTimeStamp beginsWith: Utilities authorInitials) not]]]]