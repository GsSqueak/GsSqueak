as yet unclassified
withProgressDo: aBlock

	| safetyFactor totals trialRect delta targetOwner |

	Smalltalk isMorphic ifFalse: [^aBlock value].
	formerProject := Project current.
	formerWorld := formerProject world.
	formerProcess := Processor activeProcess.
	targetMorph
		ifNil: [targetMorph := ProgressTargetRequestNotification signal].
	targetMorph ifNil: [
		trialRect := Rectangle center: Sensor cursorPoint extent: 80@80.
		delta := trialRect amountToTranslateWithin: formerWorld bounds.
		trialRect := trialRect translateBy: delta.
		translucentMorph := TranslucentProgessMorph new
			opaqueBackgroundColor: Color white;
			bounds: trialRect;
			openInWorld: formerWorld.
	] ifNotNil: [
		targetOwner := targetMorph owner.
		translucentMorph := TranslucentProgessMorph new
			setProperty: #morphicLayerNumber toValue: targetMorph morphicLayerNumber - 0.1;
			bounds: targetMorph boundsInWorld;
			openInWorld: targetMorph world.
	].
	stageCompleted := 0.
	safetyFactor := 1.1.	"better to guess high than low"
	translucentMorph setProperty: #progressStageNumber toValue: 1.
	translucentMorph hide.
	targetOwner ifNotNil: [targetOwner hide].
	totals := self loadingHistoryDataForKey: 'total'.
	newRatio := 1.0.
	estimate := totals size < 2 ifTrue: [
		15000		"be a pessimist"
	] ifFalse: [
		(totals sum - totals max) / (totals size - 1 max: 1) * safetyFactor.
	].
	start := Time millisecondClockValue.
	self forkProgressWatcher.

	[
		aBlock 
			on: ProgressInitiationException
			do: [ :ex | 
				ex sendNotificationsTo: [ :min :max :curr |
					"ignore this as it is inaccurate"
				].
			].
	] on: ProgressNotification do: [ :note | | stageCompletedString |
		translucentMorph show.
		targetOwner ifNotNil: [targetOwner show].
		note extraParam ifNotNil:[self addProgressDecoration: note extraParam].
		stageCompletedString := (note messageText findTokens: ' ') first.
		stageCompleted := (stageCompletedString copyUpTo: $:) asNumber.
		cumulativeStageTime := Time millisecondClockValue - start max: 1.
		prevData := self loadingHistoryDataForKey: stageCompletedString.
		prevData isEmpty ifFalse: [
			newRatio := (cumulativeStageTime / (prevData average max: 1)) asFloat.
		].
		self 
			loadingHistoryAt: stageCompletedString 
			add: cumulativeStageTime.
		translucentMorph 
			setProperty: #progressStageNumber 
			toValue: stageCompleted + 1.
		note resume.
	].

	stageCompleted := 999.	"we may or may not get here"

