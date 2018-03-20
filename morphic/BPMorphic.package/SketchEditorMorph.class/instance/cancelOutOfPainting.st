start & finish
cancelOutOfPainting
	"The user requested to back out of a painting session without saving"
	self deleteSelfAndSubordinates.
	emptyPicBlock
		ifNotNil: [emptyPicBlock value].
	"note no args to block!"
	hostView
		ifNotNil: [hostView changed].
	ActiveWorld resumeScriptsPausedByPainting.
	^ nil