filtering
filterList
	self hasFilter
		ifTrue: [| frontMatching substringMatching newList |
			self indicateFiltered.
			frontMatching := OrderedCollection new.
			substringMatching := OrderedCollection new.
			list
				withIndexDo: [:each :n | 
					| foundPos |
					foundPos := each asString
								findString: lastKeystrokes
								startingAt: 1
								caseSensitive: false.
					foundPos = 1
						ifTrue: [frontMatching add: each]
						ifFalse: [foundPos = 0
								ifFalse: [substringMatching add: each]]].
			newList := frontMatching , substringMatching.
			(newList isEmpty not
					or: [self allowEmptyFilterResult])
				ifTrue: [list := newList]
				ifFalse: [lastKeystrokes := lastKeystrokes allButLast: 1.
					self flash; filterList]]
		ifFalse: [self indicateUnfiltered]