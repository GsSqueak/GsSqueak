command line
run: aBlock snapshotAs: imageName andQuit: shouldQuit 
	self run: aBlock.
	imageName
		ifNil:
			[ shouldQuit ifTrue:
				[ self
					snapshot: false
					andQuit: shouldQuit ] ]
		ifNotNil:
			[ | correctName |
			correctName := (imageName endsWith: '.image')
				ifTrue: [ imageName ]
				ifFalse: [ imageName , '.image' ].
			(FileDirectory default fullNameFor: correctName) = self imageName
				ifTrue:
					[ self
						snapshot: true
						andQuit: shouldQuit ]
				ifFalse:
					[ self saveAs: imageName.
					"Avoid instant-quit when relaunching by resaving."
					shouldQuit ifTrue:
						[ self
							snapshot: true
							andQuit: shouldQuit ] ] ]
