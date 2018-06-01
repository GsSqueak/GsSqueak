initialization
createFilter
	"This is an invisible morph that catches keystrokes to filter content in multiple widgets at once. Needs #filterEnabled to be true."
	
	filterMorph := '' asText asMorph lock.
	filterMorph
		name: 'Filter';
		visible: false;
		disableTableLayout: true.
	^ filterMorph