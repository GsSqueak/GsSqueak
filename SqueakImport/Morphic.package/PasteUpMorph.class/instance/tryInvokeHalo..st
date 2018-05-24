events-processing
tryInvokeHalo: anEvent

	| innerMost target |
	anEvent hand halo ifNotNil: [^ self "No invocation needed. Halo will handle transfer itself."].
	Preferences noviceMode ifTrue: [^ self "No halo in novice mode."].
	Preferences cmdGesturesEnabled ifFalse: [^ self].
	
	innerMost := (self morphsAt: anEvent position unlocked: true) first.
	
	"1) Try to use innermost morph but skip all the ones that do not want to show a halo along the owner chain."
	target := innerMost.
	[target isNil or: [target wantsHaloFromClick]]
		whileFalse: [target := target owner].
	target ifNil: [^ self].
	
	"2) Without a modifier, which is normal, find the outermost container for that inner morph."
	(innerMost == self or: [anEvent shiftPressed]) ifFalse: [
		| previousTargets |
		previousTargets := OrderedCollection new.
		[target notNil and: [target owner ~~ self]] whileTrue: [
			previousTargets add: target.
			target := target owner].
		target ifNil: [^ self].
		[previousTargets isEmpty or: [target wantsHaloFromClick]] whileFalse: [
			target := previousTargets removeLast].
		target wantsHaloFromClick ifFalse: [^ self]].
	
	"3) Show the container of that nested structure, which is usually my direct submorph."
	target withAllOwnersDo: [:ea | ea owner == self ifTrue: [ea comeToFront]].
	
	"4) Now that we have the target, show the halo. Abort event dispatching, too, to avoid confusion."
	anEvent hand newMouseFocus: target event: anEvent.
	target invokeHaloOrMove: anEvent.
	anEvent ignore.