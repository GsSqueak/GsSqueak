events-processing
tryInvokeMetaMenu: anEvent

	| innerMost target |
	Preferences cmdGesturesEnabled ifFalse: [^ self].
	Preferences eToyFriendly ifTrue: [^ self].
	
	innerMost := (self morphsAt: anEvent position unlocked: true) first.
	
	"Traverse the owner chain if some morph does not want to show its meta menu."
	target := innerMost.
	[target isNil or: [target wantsMetaMenu]] whileFalse: [target := target owner].
	target ifNil: [^ self].
	
	target invokeMetaMenu: anEvent.
	anEvent ignore.