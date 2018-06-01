GsSqueak
saveGsSqueak

	self getGsSqueakPath ifNotNil: [:fileDirectory |
		self saveGsSqueakTo: fileDirectory]