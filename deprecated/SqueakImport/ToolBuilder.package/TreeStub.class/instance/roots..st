private
roots: anArray
	roots := anArray collect: [:ea | TreeNodeStub fromSpec: spec item: ea].
