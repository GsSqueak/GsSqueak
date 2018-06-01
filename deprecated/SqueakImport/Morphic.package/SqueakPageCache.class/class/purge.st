cache access
purge
	"Replace morphs with tombstones in all pages that are clean and not being shown.  Write any dirty ones first, if allowed to."

	| list |
	list := OrderedCollection new.
	GlobalPolicy == #neverWrite 
		ifTrue: [PageCache doPagesInMemory: [:aPage | list add: aPage prePurge]]
			"Writing only done by user's command"
		ifFalse: [
			PageCache doPagesInMemory: [:aPage | aPage write
					 list add: aPage prePurge]].
	list := list select: [:each | each notNil].
	"do bulk become:"
	(list collect: [:each | each contentsMorph])
		elementsExchangeIdentityWith:
			(list collect: [:pg | MorphObjectOut new xxxSetUrl: pg url page: pg])
