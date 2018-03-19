private
reconfigureWindowsForFocus
	self
		allSubInstancesDo: [:window | window passivate; activate; unlockWindowDecorations; passivateIfNeeded].
	self topWindow
		ifNotNil: [:wnd | wnd activate]