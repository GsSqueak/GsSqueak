world menu
disconnectAllRemoteUsers	"Disconnect all remote hands and stop transmitting events."	self world		handsDo: [:h | (h isKindOf: RemoteHandMorph)				ifTrue: [h withdrawFromWorld]]