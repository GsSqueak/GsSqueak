simulating
children
	^ (self model perform: spec getChildren with: item)
		collect: [:ea | TreeNodeStub fromSpec: spec item: ea]