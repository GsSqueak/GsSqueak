reading
processRunStackTop
	"Write accumulated attributes to run array."
	
	| currentIndex start attrs |
	currentIndex := count - offset.
	start := runStack top second.
	attrs := runStack top first.
	runArray
		addLast: attrs asArray
		times: currentIndex - start + 1.