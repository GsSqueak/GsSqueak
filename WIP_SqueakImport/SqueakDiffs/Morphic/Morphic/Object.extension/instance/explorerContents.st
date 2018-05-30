*Morphic-Explorer
explorerContents
	"Override that method to define which properties of the object should be shown in the
	object explorer. See for example the implementation in Integer>>#explorerContents."

	^ (self class allInstVarNames asOrderedCollection withIndexCollect: [:each :index |
		ObjectExplorerWrapper
			with: (self instVarAt: index)
			name: each
			model: self]) ,
		((1 to: self basicSize) collect: [:index |
			ObjectExplorerWrapper
				with: (self  basicAt: index)
				name: index printString
				model: self ])