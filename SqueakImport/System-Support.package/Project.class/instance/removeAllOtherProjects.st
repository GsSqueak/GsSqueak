shrinking
removeAllOtherProjects
	"Remove all other projects from the system, and set the current project as the root
	project. This method was originally implemented as SmalltalkImage>>zapAllOtherProjects
	in earlier versions of Squeak."

	"Project current removeAllOtherProjects"

	Project current == self ifFalse: [
		^ self
			addDeferredUIMessage: [self removeAllOtherProjects];
			enter].
	
	self beTopProject.

	Project rebuildAllProjects.  "Does a GC"
	Project allProjects do: [:p | p == Project current ifFalse: [p delete]].
		
	TheWorldMenu allInstancesDo: [:m | 1 to: m class instSize do: [:i | m instVarAt: i put: nil]].
	ChangeSet classPool at: #AllChangeSets put: nil.
	ProjectHistory currentHistory initialize.
	CommandHistory resetAllHistory.
	ChangeSet initialize.

	self assert: Project current == self.