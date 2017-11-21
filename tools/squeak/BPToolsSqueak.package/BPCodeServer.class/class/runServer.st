as yet unclassified
runServer
	| class symbol writeStream |

	TcpSocket ifNotNil: [TcpSocket close].
	
	[[true] whileTrue: [
		TcpSocket := Socket newTCP.
		TcpSocket listenOn: 1742.
		(TcpSocket waitForConnectionFor: 10000 ifTimedOut: [nil] ifRefused: [nil]) ifNotNil: [
			symbol := (self removeNewLineFromString: (TcpSocket receiveData)) asSymbol.
			class := Smalltalk at: symbol ifAbsent: [nil].
		
			class ifNotNil: [
				writeStream := WriteStream on: ''.
				class fileOutTo: writeStream.
				TcpSocket sendData: writeStream contents]].
		TcpSocket close]] fork.
	