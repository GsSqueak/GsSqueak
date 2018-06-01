as yet unclassified
fullPath: serverAndDirectory
	"Parse and save a full path.  Separate out fileName at the end."

	| delim ii |
	super fullPath: serverAndDirectory.		"set server and directory"
	self isTypeFile ifTrue: [
		fileName :=  ''.
		^ self
	].
	delim := self pathNameDelimiter.
	ii := directory findLast: [:c | c = delim].
	ii = 0
		ifTrue: [self error: 'expecting directory and fileName']
		ifFalse: [fileName := directory copyFrom: ii+1 to: directory size.
			directory := (directory copyFrom: 1 to: directory size - fileName size - 1)].