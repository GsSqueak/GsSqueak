utility
trimComment

	comment := self loadedComment ifNotNil: [:aString |
					aString = self originalComment
						ifTrue: [nil]
						ifFalse: [aString]]