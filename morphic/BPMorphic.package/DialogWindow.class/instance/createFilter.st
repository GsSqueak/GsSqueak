initialization
createFilter
	filterMorph := '' asText asMorph lock.
	filterMorph visible: false;
		 disableTableLayout: true.
	^ filterMorph