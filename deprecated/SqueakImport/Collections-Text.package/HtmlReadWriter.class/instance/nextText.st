private
nextText

	count := 0.
	offset := 0. "To ignore characters in the input string that are used by tags."
	
	runStack := Stack new.
	
	runArray := RunArray new.
	string := OrderedCollection new.
	
	"{text attributes. current start index. original start}"
	runStack push: {OrderedCollection new. 1. 1}.

	[stream atEnd] whileFalse: [self processNextTag].
	self processRunStackTop. "Add last run."

	string := String withAll: string.
	runArray coalesce.
	
	^ Text
		string: string
		runs: runArray