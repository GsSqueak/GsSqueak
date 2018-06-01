filtering
filterToCurrentChangeSet
	"Filter the receiver's list down to only those items in the current change set"

	self filterFrom:
		[:aClass :aSelector |
			(aClass notNil and: [aSelector notNil]) and:
				[(ChangeSet current atSelector: aSelector class: aClass) ~~ #none]]