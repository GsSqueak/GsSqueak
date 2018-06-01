all changes
trimHistory
	"Drop non-essential history."
	| realClass |
	realClass := self realClass.

	"Forget methods added and later removed"
	methodChanges keysAndValuesRemove:
		[:sel :chgRecord |
		chgRecord changeType == #addedThenRemoved
		"this removes methods that have been lost, e.g. by being deleted in a different change set, etc"
		or: [(chgRecord changeType == #add or: [chgRecord changeType == #change])
			and: [realClass isNil or: [(realClass includesSelector: sel) not]]]].

	"Forget renaming and reorganization of newly-added classes."
	(changeTypes includes: #add) ifTrue:
		[changeTypes removeAllFoundIn: #(rename reorganize)]