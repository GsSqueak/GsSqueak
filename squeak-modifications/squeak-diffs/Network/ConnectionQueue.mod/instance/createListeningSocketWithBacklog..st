private
createListeningSocketWithBacklog: aNumber
	| addressInfo sock |
	self portNumbers do: [:trialportNumber | 
		addressInfo := SocketAddressInformation
			forHost: ''
			service: trialportNumber asString
			flags: SocketAddressInformation passiveFlag
			addressFamily: SocketAddressInformation addressFamilyINET4
			socketType: SocketAddressInformation socketTypeStream
			protocol: SocketAddressInformation protocolTCP.
		sock := [addressInfo first listenWithBacklog: aNumber] ifError: [nil].
		sock ifNotNil: [
			portNumber := trialportNumber.
			^ sock]].
	^ nil