as yet unclassified
killServer
	TcpSocket ifNotNil: [TcpSocket closeAndDestroy:5].
	TcpSocket := nil.
	
