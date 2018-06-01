project lifetime
remember: aProject

	| newTuple |

	newTuple := self forget: aProject.
	mostRecent addFirst: newTuple.
	mostRecent size > 10 ifTrue: [mostRecent := mostRecent copyFrom: 1 to: 10].
	self changed