toolbuilder
accept

	self cancelled: false.
	self acceptChanges.
	self class template: self.
	self close