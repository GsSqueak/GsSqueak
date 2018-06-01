available servers
serverForURL: aURLString
	| serversForURL server urlPath serverPath relPath |
	serversForURL := self servers values select: [:each |
		(aURLString beginsWith: each downloadUrl)
		or: [(aURLString beginsWith: each realUrl)
		or: [aURLString , '/' beginsWith: each downloadUrl]]].
	serversForURL isEmpty
		ifTrue: [^nil].
	server := serversForURL first.
	urlPath := aURLString asUrl path.
	(urlPath isEmpty not
		and: [urlPath last isEmpty])
		ifTrue: [urlPath removeLast].
	serverPath := server downloadUrl asUrl path.
	(serverPath isEmpty not
		and: [serverPath last isEmpty])
		ifTrue: [serverPath removeLast].
	urlPath size < serverPath size
		ifTrue: [^nil].
	relPath := String new.
	serverPath size +1 to: urlPath size do: [:i | relPath := relPath , '/' , (urlPath at: i)].
	^relPath isEmpty
		ifTrue: [server]
		ifFalse: [server directoryNamed: (relPath copyFrom: 2 to: relPath size)]