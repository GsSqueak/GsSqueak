preferences
browseWithDragNDrop
	<preference: 'Browse with drag ''n'' drop' category: 'browsing' description: 'If true, new browsers will open with drag & drop functionality (only in Morphic)' type: #Boolean>
	^ BrowseWithDragNDrop ifNil: [false].