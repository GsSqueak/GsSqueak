file in/out
exportSegmentInSexpWithChangeSet: aChangeSetOrNil fileName: aFileName directory: aDirectory withoutInteraction: noInteraction

	| fd sexp actualName |

	world ifNil: [^ false].
	world presenter ifNil: [^ false].
	(world respondsTo: #sissScanObjectsAsEtoysProject) ifFalse: [^ false].

	Command initialize.
	world clearCommandHistory.
	world cleanseStepList.
	world localFlapTabs size = world flapTabs size ifFalse: [
		noInteraction ifTrue: [^ false].
		self error: 'Still holding onto Global flaps'].

	fd := aDirectory directoryNamed: self resourceDirectoryName.
	fd assureExistence.

	"Must activate old world because this is run at #armsLength.
	Otherwise references to ActiveWorld, ActiveHand, or ActiveEvent
	will not be captured correctly if referenced from blocks or user code."
	world becomeActiveDuring:[
		sexp := world sissScanObjectsAsEtoysProject.
	].
	(aFileName endsWith: '.pr') ifTrue: [
		actualName := (aFileName copyFrom: 1 to: aFileName size - 3), '.sexp'.
	] ifFalse: [
		actualName := aFileName
	].

	self
		writeForExportInSexp: sexp withSources: actualName
		inDirectory: fd
		changeSet: aChangeSetOrNil.
	SecurityManager default signFile: actualName directory: fd.
	self storeHtmlPageIn: fd.
	(world valueOfProperty: #ProjectDetails ifAbsent: [Dictionary new])
		at: 'Project-Format' put: 'S-Expression'.
	self storeManifestFileIn: fd.
	self compressFilesIn: fd to: aFileName in: aDirectory.

	^ true
