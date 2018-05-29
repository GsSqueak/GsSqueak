the buttons
findSomethingOnSuperSwiki

	| projectServers server index |
	projectServers := ServerDirectory projectServers.
	projectServers isEmpty
		ifTrue: [^self].
	projectServers size = 1
		ifTrue: [server := projectServers first]
		ifFalse: [index := UIManager default chooseFrom: (projectServers collect: [:each | (ServerDirectory nameForServer: each) translatedIfCorresponds]) 
				title: 'Choose a super swiki:' translated.
			index > 0
				ifTrue: [server := projectServers at: index]
				ifFalse: [^self]].
	Smalltalk at: #EToyProjectQueryMorph ifPresent:[:aClass| aClass onServer: server].