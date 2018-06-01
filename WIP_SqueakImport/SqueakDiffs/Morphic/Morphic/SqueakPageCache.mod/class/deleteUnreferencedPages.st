housekeeping
deleteUnreferencedPages
	"Remove any pages that are not current referred to by any book or URL morph."
	"Details: Since unreferenced pages could refer to other pages, this process is iterated until no unreferenced pages can be found. It currently does not collect cycles."
	"SqueakPageCache deleteUnreferencedPages"

	| unreferenced |
	[
		Smalltalk garbageCollect.
		unreferenced := PageCache keys asSet.
		URLMorph allSubInstancesDo: [:m | unreferenced remove: m url ifAbsent: []].
		MorphObjectOut allInstancesDo: [:ticklish |
			unreferenced remove: ticklish url ifAbsent: []].
		unreferenced size = 0 ifTrue: [^ self].
		unreferenced do: [:url | PageCache removeKey: url ifAbsent: []]] repeat
