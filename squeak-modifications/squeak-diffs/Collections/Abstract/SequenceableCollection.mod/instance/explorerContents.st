*Morphic-Explorer
explorerContents

	^Array new: self size streamContents: [ :stream |
		1 to: self size do: [ :index |
			stream nextPut: (
				ObjectExplorerWrapper
					with: (self at: index)
					name: index printString
					model: self) ] ]