file in/out
serverList
	| servers |
	"Take my list of server URLs and return a list of ServerDirectories to write on."

	urlList isEmptyOrNil ifTrue: [^ nil].
	servers := OrderedCollection new.
	urlList do: [:url | | server |
		server := ServerDirectory serverForURL: url.
		server ifNotNil: [servers add: server].
		server := ServerDirectory serverForURL: url asUrl downloadUrl.
		server ifNotNil: [servers add: server]].
	^servers isEmpty
		ifTrue: [nil]
		ifFalse: [servers]