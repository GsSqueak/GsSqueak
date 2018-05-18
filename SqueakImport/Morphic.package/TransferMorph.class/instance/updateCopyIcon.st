private
updateCopyIcon

	(self submorphNamed: #tmCopyIcon)
		ifNil: [self shouldCopy ifTrue: [
			self addMorphFront: (ImageMorph new image: CopyPlusIcon; name: #tmCopyIcon; yourself)]]
		ifNotNil: [:copyIcon | self shouldCopy ifFalse: [
			copyIcon delete]]