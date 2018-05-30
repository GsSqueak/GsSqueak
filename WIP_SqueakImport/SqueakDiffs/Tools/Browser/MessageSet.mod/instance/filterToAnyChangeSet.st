filtering
filterToAnyChangeSet
	"Filter down only to messages present in ANY change set"

	self filterFrom:
		[:aClass :aSelector |
			ChangesOrganizer doesAnyChangeSetHaveClass: aClass andSelector: aSelector]
