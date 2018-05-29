actions
deselectAll
	super deselectAll.
	1 to: messageSelections size do: [ :index | messageSelections at: index put: false ]
