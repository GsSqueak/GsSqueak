accessing
topazProxy: aTopazProxy

	topazProxy := aTopazProxy.
	self systemOrganizer: (TopazSystemOrganizer suppliedBy: topazProxy)