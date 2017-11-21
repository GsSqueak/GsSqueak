as yet unclassified
killServer
	TcpSocket ifNotNil: [TcpSocket close].
	TcpSocket := nil.
	