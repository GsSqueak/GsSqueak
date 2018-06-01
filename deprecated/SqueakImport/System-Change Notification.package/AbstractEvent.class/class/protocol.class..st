instance creation
protocol: aProtocol class: aClass

	| instance |
	instance := self item: aProtocol kind: self protocolKind.
	instance itemClass: aClass.
	^instance