menu messages
exit
	"Leave the current project and return to the project in which this one was created."

	self isTopProject ifTrue: [^ self inform: 'Can''t exit the top project' translated].
	parentProject enter: false revert: false saveForRevert: false.
