enter
enter: returningFlag revert: revertFlag saveForRevert: saveForRevert
	"Install my ChangeSet, Transcript, and scheduled views as current globals. If returningFlag is true, we will return to the project from whence the current project was entered; don't change its previousProject link in this case.
	If saveForRevert is true, save the ImageSegment of the project being left.
	If revertFlag is true, make stubs for the world of the project being left.
	If revertWithoutAsking is true in the project being left, then always revert."

	| leavingProject forceRevert response seg |

	self isIncompletelyLoaded
		ifTrue: [^ self loadFromServer: true].
	self isCurrentProject
		ifTrue: [^ self].
	
	EmergencyRecoveryRequested := false. "normal project entry clears recursion guard"
	forceRevert := false.
	CurrentProject ifNotNil: [
	    CurrentProject rawParameters 
		    ifNil: [revertFlag ifTrue: [^ self inform: 'nothing to revert to' translated]]
		    ifNotNil: [saveForRevert ifFalse: [
				    forceRevert := CurrentProject projectParameters 
								    at: #revertWithoutAsking ifAbsent: [false]]].
	  forceRevert not & revertFlag ifTrue: [
		  response := (UIManager default chooseFrom: {
			  'Revert to saved version' translated.
			  'Cancel' translated.
		  } title: 'Are you sure you want to destroy this Project\ and revert to an older version?\\(From the parent project, click on this project''s thumbnail.)' translated withCRs) = 1.
		  response ifFalse: [^ self]].

	  revertFlag | forceRevert 
		  ifTrue: [seg := CurrentProject projectParameters at: #revertToMe ifAbsent: [
					  ^ self inform: 'nothing to revert to' translated]]
		  ifFalse: [
			  CurrentProject makeThumbnail.
			  returningFlag == #specialReturn
				  ifTrue:
					  [ProjectHistory forget: CurrentProject.		"this guy is irrelevant"
					  Project forget: CurrentProject]
				  ifFalse:
					  [ProjectHistory remember: CurrentProject]].

	  (revertFlag | saveForRevert | forceRevert) ifFalse: [
		  (Preferences valueOfFlag: #projectsSentToDisk)
			  ifTrue: [
				  self inform: 'Project serialization via image segments\does not work at the moment. Disabling the\preference #projectsSentToDisk now...' withCRs.
				  Preferences disable: #projectsSentToDisk.
				  "self storeToMakeRoom"]].

	  "Update display depth for leaving and entring project."
	  CurrentProject displayDepth: Display depth].

	displayDepth == nil ifTrue: [displayDepth := Display depth].
	self installNewDisplay: Display extent depth: displayDepth.

  CurrentProject ifNotNil: [
	  returningFlag == #specialReturn ifTrue: [
		  CurrentProject removeChangeSetIfPossible.	"keep this stuff from accumulating"
		  nextProject := nil
	  ] ifFalse: [
		  returningFlag
			  ifTrue: [nextProject := CurrentProject]
			  ifFalse: [previousProject := CurrentProject].
	  ].

	  CurrentProject world triggerEvent: #aboutToLeaveWorld.
	  CurrentProject abortResourceLoading.
	  CurrentProject finalExitActions: self.
	  CurrentProject saveState].
	
	"********** SWITCHING CURRENT PROJECT **********"
	leavingProject := CurrentProject.
	CurrentProject := self.
	ProjectHistory remember: self.
	"********** SWITCHING CURRENT PROJECT **********"

	self loadState.
	self finalEnterActions: leavingProject.
	self addDeferredUIMessage: [self startResourceLoading].
	self world triggerEvent: #aboutToEnterWorld.

	"Save project for revert."
	saveForRevert ifTrue: [
		Smalltalk garbageCollect.	"let go of pointers"
		leavingProject storeSegment.
		"result :=" leavingProject world isInMemory 
			ifTrue: ['Can''t seem to write the project.']
			ifFalse: [leavingProject projectParameters at: #revertToMe put: 
					leavingProject world xxxSegment shallowCopy].
				'Project written.'].
			"original is for coming back in and continuing."
	revertFlag | forceRevert ifTrue: [
		seg shallowCopy revert].	"non-cloned one is for reverting again later"
	self removeParameter: #exportState.
	
	"Now that everything is set up, we can show zoom animation."
	(self showZoom and: [leavingProject isNotNil])
		ifTrue: [self displayZoom: leavingProject parent ~~ self "Entering?"]
		ifFalse: [self restore].
	
	"Update processes at last."
	self scheduleProcessForEnter.
	leavingProject ifNotNil: [
	  leavingProject terminateProcessForLeave ]
