pause/resume
resumeIn: aWorld
	"Resume playing or recording after a project switch."

	self state = #suspendedPlay ifTrue:
		[self resumePlayIn: aWorld].
	self state = #suspendedRecord ifTrue:
		[self resumeRecordIn: aWorld].
