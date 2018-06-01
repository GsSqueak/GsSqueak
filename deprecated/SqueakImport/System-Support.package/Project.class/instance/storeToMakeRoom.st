file in/out
storeToMakeRoom
	"Write out enough projects to fulfill the space goals.
	Include the size of the project about to come in."

	| params memoryEnd goalFree cnt gain proj skip tried |
	GoalFreePercent ifNil: [GoalFreePercent := 33].
	GoalNotMoreThan ifNil: [GoalNotMoreThan := 20000000].
	params := Smalltalk  getVMParameters.
	memoryEnd	:= params at: 3.
"	youngSpaceEnd	:= params at: 2.
	free := memoryEnd - youngSpaceEnd.
"
	goalFree := GoalFreePercent asFloat / 100.0 * memoryEnd.
	goalFree := goalFree min: GoalNotMoreThan.
	world isInMemory ifFalse: ["enough room to bring it in"
		goalFree := goalFree + (self projectParameters at: #segmentSize ifAbsent: [0])].
	cnt := 30.
	gain := Smalltalk garbageCollectMost.
	"skip a random number of projects that are in memory"
	proj := self.  skip := 6 atRandom.
	[proj := proj nextInstance ifNil: [Project someInstance].
		proj world isInMemory ifTrue: [skip := skip - 1].
		skip > 0] whileTrue.
	cnt := 0.  tried := 0.

	[gain > goalFree] whileFalse: [
		proj := proj nextInstance ifNil: [Project someInstance].
		proj storeSegment ifTrue: ["Yes, did send its morphs to the disk"
			gain := gain + (proj projectParameters at: #segmentSize 
						ifAbsent: [20000]).	"a guess"
			Beeper beep.
			(cnt := cnt + 1) > 5 ifTrue: [^ self]].	"put out 5 at most"
		(tried := tried + 1) > 23 ifTrue: [^ self]].	"don't get stuck in a loop"