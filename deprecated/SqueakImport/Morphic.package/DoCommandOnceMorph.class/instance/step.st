stepping and presenter
step

	| goForIt |

	actionBlock ifNil: [^self stopStepping].
	goForIt := actionBlock.
	actionBlock := nil.
	goForIt
		on: ProgressTargetRequestNotification
		do: [ :ex | ex resume: innerArea].		"in case a save/load progress display needs a home"
