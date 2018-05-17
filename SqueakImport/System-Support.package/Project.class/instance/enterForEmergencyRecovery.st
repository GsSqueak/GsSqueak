enter - recovery
enterForEmergencyRecovery
	"Stripped down verion of #enter:revert:saveForRevert:. More error handling. Less features."
	
	| leavingProject process titleForDebuggerWindow |
	self isCurrentProject ifTrue: [^ self].
	EmergencyRecoveryRequested == true ifTrue: [^ self].
	EmergencyRecoveryRequested := true. "set recursion guard"

	titleForDebuggerWindow := 'FATAL PROJECT ERROR: Project was ''', CurrentProject name, ''''.
	ProjectHistory remember: CurrentProject.
	nextProject := CurrentProject.
	
	[ CurrentProject world triggerEvent: #aboutToLeaveWorld.
	CurrentProject abortResourceLoading.
	CurrentProject finalExitActions: self.
	CurrentProject saveState ] on: Error do: [:ex | "Ignore." ].
	
	"********** SWITCHING CURRENT PROJECT **********"
	leavingProject := CurrentProject.
	CurrentProject := self.
	ProjectHistory remember: self.
	"********** SWITCHING CURRENT PROJECT **********"

	self loadState.
	self finalEnterActions: leavingProject.
	self addDeferredUIMessage: [self startResourceLoading].
	self world triggerEvent: #aboutToEnterWorld.
	
	"Now that everything is set up, we can show zoom animation.
	Do we really need this in case of an emergency?"
	self showZoom
		ifTrue: [self displayZoom: leavingProject parent ~~ self "Entering?"]
		ifFalse: [self restore].
	
	"Update processes at last."
	self scheduleProcessForEnter.
	
	"Do not terminate but suspend the projects ui process to support debugging."
	process := leavingProject uiProcess.
	self addDeferredUIMessage: [process debugWithTitle: titleForDebuggerWindow].
	leavingProject suspendProcessForDebug.