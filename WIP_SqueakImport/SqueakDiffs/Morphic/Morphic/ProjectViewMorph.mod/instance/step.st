stepping and presenter
step
	| cmd |
	"Check for a command that could not be executed in my subproject.  Once it is done, remove the trigger.  If this is too slow, make armsLengthCmd an inst var."

	self seeIfNameChanged.
	cmd := self valueOfProperty: #armsLengthCmd.
	cmd ifNil: [^ super step].
	self removeProperty: #armsLengthCmd.
	project perform: cmd.
	project enter.