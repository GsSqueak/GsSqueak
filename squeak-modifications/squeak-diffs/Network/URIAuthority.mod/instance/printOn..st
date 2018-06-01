printing
printOn: stream
	userInfo
		ifNotNil: [
			stream nextPut: $@ .
			stream nextPutAll: userInfo].
	stream nextPutAll: host.
	port
		ifNotNil: [
			stream nextPut: $: .
			port printOn: stream] 