private
loadPageWithProgress
	"Load the desired page, showing a progress indicator as we go"
	
	| projectInfo projectName beSpaceHandler |
	projectInfo := listOfPages at: currentIndex.
	projectName := projectInfo first.
	loadedProject := Project named: projectName.
	self class know: listOfPages as: threadName.
	beSpaceHandler := (ActiveWorld keyboardNavigationHandler == self).
	WorldState addDeferredUIMessage:
		[InternalThreadNavigationMorph openThreadNamed: threadName atIndex: currentIndex beKeyboardHandler: beSpaceHandler].

	loadedProject ifNil: [
		ComplexProgressIndicator new 
			targetMorph: self;
			historyCategory: 'project loading' translated;
			withProgressDo: [
				[
					loadedProject := Project current 
							fromMyServerLoad: projectName
				] 
					on: ProjectViewOpenNotification
					do: [ :ex | ex resume: false]		
						"we probably don't want a project view morph in this case"
			].
	].
	loadedProject ifNil: [
		^self inform: 'I cannot find that project' translated
	].
	self delete.

	loadedProject enter.
