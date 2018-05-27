coloring
colorForId: anInteger

	^ self colorWheel at: (anInteger \\ self colorWheel size + 1)