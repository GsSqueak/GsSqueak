instance creation
pathParts: fullName 
	"private - parse fullName in server and directory"
	| url slashPos server directory |
	url := fullName.
	(url beginsWith: 'http://')
		ifTrue: [url := url allButFirst: 7].
	url last = $/
		ifTrue: [url := url allButLast].
	""
	slashPos := url indexOf: $/.
	slashPos isZero
		ifTrue: [^ {'http://' , url}].
	""
	server := url first: slashPos - 1.
	directory := url allButFirst: slashPos.
	""
	^ {'http://' , server. directory}