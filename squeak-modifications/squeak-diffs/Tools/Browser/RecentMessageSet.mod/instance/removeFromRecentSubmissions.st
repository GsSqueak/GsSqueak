message functions
removeFromRecentSubmissions
	"Remove the currently-selected method from the RecentMessages list"

	| aClass methodSym |
	((aClass := self selectedClassOrMetaClass) notNil and: [(methodSym := self selectedMessageName) notNil])
		ifTrue: 
			[RecentMessages default purgeFromRecentSubmissions: (MethodReference class: aClass selector: methodSym).
			self reformulateList]