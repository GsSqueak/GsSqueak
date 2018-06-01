accessing
peerName
	"Return the name of the host I'm connected to, or nil if its name isn't known to the domain name server or the request times out."
	"Note: Slow. Calls the domain name server, taking up to 20 seconds to time out. Even when sucessful, delays of up to 13 seconds have been observed during periods of high network load." 

	| remoteAddress |
	NetNameResolver useOldNetwork ifFalse: [ ^self remoteAddress hostName ].
	(remoteAddress := self remoteAddress) = #[0 0 0 0] ifTrue: [
		"Don't wait for the lookup"
		^nil ].
	^NetNameResolver 
		nameForAddress:  remoteAddress
		timeout: 20