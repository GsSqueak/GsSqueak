topological sort
sortTopologically
	"Plenty of room for increased efficiency in this one."

	| remaining result pick |
	remaining := self asOrderedCollection.
	result := OrderedCollection new.
	[remaining isEmpty] whileFalse: [
		pick := remaining select: [:item |
			remaining allSatisfy: [:anotherItem |
				item == anotherItem or: [self should: item precede: anotherItem]]].
		pick isEmpty ifTrue: [self error: 'bad topological ordering'].
		result addAll: pick.
		remaining removeAll: pick].
	^self copySameFrom: result