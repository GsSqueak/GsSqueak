as yet unclassified
forkProgressWatcher

	[
	| currentWorld killTarget |
		currentWorld := Project current world.
		[stageCompleted < 999 and: 
				[formerProject == Project current and: 
				[formerWorld == currentWorld and: 
				[translucentMorph world notNil and:
				[formerProcess suspendedContext notNil and: 
				[Project uiProcess == formerProcess]]]]]] whileTrue: [

			translucentMorph setProperty: #revealTimes toValue: 
					{(Time millisecondClockValue - start max: 1). (estimate * newRatio max: 1)}.
			translucentMorph changed.
			translucentMorph owner addMorphInLayer: translucentMorph.
			(Time millisecondClockValue - WorldState lastCycleTime) abs > 500 ifTrue: [
				self backgroundWorldDisplay
			].
			(Delay forMilliseconds: 100) wait.
		].
		translucentMorph removeProperty: #revealTimes.
		self loadingHistoryAt: 'total' add: (Time millisecondClockValue - start max: 1).
		killTarget := targetMorph ifNotNil: [
			targetMorph valueOfProperty: #deleteOnProgressCompletion
		].
		formerWorld == currentWorld ifTrue: [
			translucentMorph delete.
			killTarget ifNotNil: [killTarget delete].
		] ifFalse: [
			translucentMorph privateDeleteWithAbsolutelyNoSideEffects.
			killTarget ifNotNil: [killTarget privateDeleteWithAbsolutelyNoSideEffects].
		].
	] forkAt: Processor lowIOPriority.