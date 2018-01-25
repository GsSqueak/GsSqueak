as yet unclassified
runServer
	| class symbol |

	TcpSocket ifNotNil: [self killServer].
	
	[[true] whileTrue: [
		TcpSocket := Socket newTCP.
		TcpSocket listenOn: self serverPort .
		(TcpSocket waitForConnectionFor: 10000 ifTimedOut: [nil] ifRefused: [nil]) ifNotNil: [
			symbol := (self removeNewLineFromString: (TcpSocket receiveData)) asSymbol.
			class := Smalltalk at: symbol ifAbsent: [nil].
			
			class ifNotNil: [
				self respondForClass: class]].
		TcpSocket close]] fork.
	
