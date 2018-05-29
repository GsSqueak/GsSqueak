filtering
filterToMessagesWithHardenedClasses
	"Filter the receiver's list down to only those items representing methods of hardened classes, as opposed to uniclasses"

	self filterFrom:
		[:aClass :aSelector |
			(aClass notNil and: [aSelector notNil]) and:
				[aClass isUniClass not]]