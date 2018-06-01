GsSqueak
loadGsSqueak

	self getGsSqueakPath ifNotNil: [:fileDirectory |
		self loadSqueakFrom: fileDirectory]