enter
finalEnterActions: leavingProject
	"Perform the final actions necessary as the receiver project is entered"

	| navigator armsLengthCmd navType thingsToUnhibernate |
	"If this image has a global World variable, update it now"
	Smalltalk globals at: #World
		ifPresent: [ :w | Smalltalk globals at: #World put: world ].
	world install.
	leavingProject ifNotNil: [
  	world transferRemoteServerFrom: leavingProject world].
	"(revertFlag | saveForRevert | forceRevert) ifFalse: [
		(Preferences valueOfFlag: #projectsSentToDisk) ifTrue: [
			self storeSomeSegment]]."
	
	"Transfer event recorder to me."
	leavinProject ifNotNil: [
    leavingProject isMorphic ifTrue: [
	    leavingProject world pauseEventRecorder ifNotNil: [:rec |
		    rec resumeIn: world]]].

	world triggerOpeningScripts.


	self initializeMenus.
	self projectParameters 
		at: #projectsToBeDeleted 
		ifPresent: [ :projectsToBeDeleted |
			self removeParameter: #projectsToBeDeleted.
			projectsToBeDeleted do: [:each | each delete]].

	Locale switchAndInstallFontToID: self localeID.

	thingsToUnhibernate := world valueOfProperty: #thingsToUnhibernate ifAbsent: [#()].
	thingsToUnhibernate do: [:each | each unhibernate].
	world removeProperty: #thingsToUnhibernate.

	navType := ProjectNavigationMorph preferredNavigator.
	armsLengthCmd := self parameterAt: #armsLengthCmd ifAbsent: [nil].
	navigator := world findA: navType.
	(Preferences classicNavigatorEnabled and: [Preferences showProjectNavigator and: [navigator isNil]]) ifTrue:
		[(navigator := navType new)
			bottomLeft: world bottomLeft;
			openInWorld: world].
	navigator notNil & armsLengthCmd notNil ifTrue:
		[navigator color: Color lightBlue].
	armsLengthCmd notNil ifTrue:
		[Preferences showFlapsWhenPublishing
			ifFalse:
				[self flapsSuppressed: true.
				navigator ifNotNil:	[navigator visible: false]].
		armsLengthCmd openInWorld: world].
	world reformulateUpdatingMenus.
	world presenter positionStandardPlayer.
	self assureMainDockingBarPresenceMatchesPreference.

	world repairEmbeddedWorlds.
