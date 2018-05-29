preferences
useMultiWindowBrowsers
	<preference: 'Multi-window browsers'
		category: 'browsing'
		description: 'When enabled, the browser uses a multi-window to conserve real-estate.  e.g. enable then click in the window label of a browser to see the items being browsed.'
		type: #Boolean>
	^MultiWindowBrowsers ifNil: [false]