stepping and presenter
step

	| t |
	score ifNil: [^ self].

	lastMutedState ~= scorePlayer mutedState ifTrue: [
		self rebuildFromScore.
		lastMutedState := scorePlayer mutedState copy].

	t := scorePlayer ticksSinceStart.
	t = lastUpdateTick ifFalse: [
		self moveCursorToTime: t.
		lastUpdateTick := t].
