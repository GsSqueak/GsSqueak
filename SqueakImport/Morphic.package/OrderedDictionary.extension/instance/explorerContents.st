*Morphic-Explorer
explorerContents

	^self keys replace: [ :key |
		ObjectExplorerWrapper
			with: (self at: key)
			name: (key printString contractTo: 32)
			model: self ]
