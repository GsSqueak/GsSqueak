-signals-morphic
sgDisconnectSignal: aSignal from: aReceiver selector: aSelector 
	| _gsSqueakTemp_connections |
	_gsSqueakTemp_connections := (self signalConnectionsForOwnerChain
				at: aSignal
				ifAbsent: [^ self])
				at: aReceiver
				ifAbsent: [^ self].
	_gsSqueakTemp_connections
		removeAllSuchThat: [:c | c selector == aSelector].
	_gsSqueakTemp_connections
		ifEmpty: [(self signalConnectionsForOwnerChain at: aSignal)
				removeKey: aReceiver].
	(self signalConnectionsForOwnerChain at: aSignal)
		ifEmpty: [self signalConnectionsForOwnerChain removeKey: aSignal]