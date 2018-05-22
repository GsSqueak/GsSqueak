file in/out
revert
	| |
	"Exit this project and do not save it.  Warn user unless in dangerous projectRevertNoAsk mode.  Exit to the parent project.  Do a revert on a clone of the segment, to allow later reverts."

	projectParameters ifNil: [^ self inform: 'nothing to revert to' translated].
	parentProject enter: false revert: true saveForRevert: false.
	"does not return!"
