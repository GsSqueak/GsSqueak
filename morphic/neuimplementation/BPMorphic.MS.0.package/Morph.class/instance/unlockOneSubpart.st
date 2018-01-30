e-toy support
unlockOneSubpart
	| unlockables reply |
	unlockables := self submorphs
				select: [:m | m isLocked].
	unlockables size <= 1
		ifTrue: [^ self unlockContents].
	reply := UIManager default
				chooseFrom: (unlockables
						collect: [:m | m externalName])
				values: unlockables
				title: 'Who should be be unlocked?' translated.
	reply isNil
		ifTrue: [^ self].
	reply unlock