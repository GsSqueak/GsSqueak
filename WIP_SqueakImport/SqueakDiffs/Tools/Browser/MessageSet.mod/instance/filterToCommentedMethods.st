filtering
filterToCommentedMethods
	"Filter the receiver's list down to only those items which have comments"

	self filterFrom:
		[:aClass :aSelector |
			(aClass includesSelector: aSelector) and:
						[(aClass firstPrecodeCommentFor: aSelector) isEmptyOrNil not]]