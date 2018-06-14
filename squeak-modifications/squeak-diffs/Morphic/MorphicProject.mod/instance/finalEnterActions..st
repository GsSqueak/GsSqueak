enter
finalEnterActions: leavingProject
	"Perform the final actions necessary as the receiver project is entered"

	| navigator armsLengthCmd navType thingsToUnhibernate |
	"GsSqueak should have a World variable. During bootstrap it is created at this point"
	Smalltalk globals at: #World put: world .
	World color: Color spindrift.
	
	world install.
	leavingProject ifNotNil: [
  	world transferRemoteServerFrom: leavingProject world].
	"(revertFlag | saveForRevert | forceRevert) ifFalse: [
		(Preferences valueOfFlag: #projectsSentToDisk) ifTrue: [
			self storeSomeSegment]]."
	
	"Transfer event recorder to me."
	leavingProject ifNotNil: [
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

