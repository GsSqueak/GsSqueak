preferences
useRetractableScrollBars: aBoolean 
	UseRetractableScrollBars = aBoolean
		ifTrue: [^ self].
	UseRetractableScrollBars := aBoolean.
	ScrollPane allSubInstances
		do: [:pane | 
			pane retractable: aBoolean.
			pane setScrollDeltas]