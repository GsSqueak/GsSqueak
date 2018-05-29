saving
urlNoOverwrite: suggested
	"Look in the directory.  If there is a file of this name, create a new name.  Keep track of highest numbers used as a hint."

	| dir ll stem num local trial suffix |
	(suggested endsWith: '.sp') ifTrue: [suffix := '.sp'].
	(suggested endsWith: '.bo') ifTrue: [suffix := '.bo'].
	suffix ifNil: [self error: 'unknown suffix'].
	dir := ServerFile new fullPath: suggested.
	(dir includesKey: dir fileName) ifFalse: [^ url := suggested].
	"File already exists!  Create a new name"
	"Find the stem file name"
	stem := SqueakPage stemUrl: suggested.
	num := stem = RecentStem ifTrue: [RecentMaxNum+1] ifFalse: [1].

	local := dir fileName.	"ugh, take stem again..."
	ll := local findLast: [:char | char == $.].
	ll = 0 ifFalse: [local := local copyFrom: 1 to: ll-1].	"remove .sp"
	local := (local splitInteger) at: 1.		"remove trailing number"
	local last == $x ifFalse: [local := local , 'x'].
	[trial := local, num printString, suffix.
		dir includesKey: trial] whileTrue: [num := num + 1].
	RecentStem := stem.  RecentMaxNum := num.
	^ url := stem, 'x', num printString, suffix