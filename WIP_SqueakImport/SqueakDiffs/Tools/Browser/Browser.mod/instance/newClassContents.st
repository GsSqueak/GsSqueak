accessing
newClassContents
	| theClassName |
	^ (theClassName := self selectedClassName)
		ifNil:
			[Class template: self selectedSystemCategory]
		ifNotNil:
			[Class templateForSubclassOf: theClassName asString category: self selectedSystemCategory]