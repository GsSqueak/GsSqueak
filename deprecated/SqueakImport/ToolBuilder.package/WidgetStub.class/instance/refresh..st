events
refresh: var
	| value |
	value := spec perform: var.
	self refresh: var with: value