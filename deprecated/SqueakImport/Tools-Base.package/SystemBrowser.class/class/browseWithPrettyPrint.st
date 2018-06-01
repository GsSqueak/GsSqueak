preferences
browseWithPrettyPrint
	<preference: 'Browse with pretty-print' category: 'browsing' description: 'If true, browsers will automatically format their contents' type: #Boolean>
	^ BrowseWithPrettyPrint ifNil: [false].