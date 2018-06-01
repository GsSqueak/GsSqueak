*Morphic-Explorer
explorerContents 

	^Array new: self size streamContents: [ :stream |
		self do: [ :each |
			stream nextPut: (
				ObjectExplorerWrapper
					with: each
					name: (stream position + 1) printString
					model: self) ] ]