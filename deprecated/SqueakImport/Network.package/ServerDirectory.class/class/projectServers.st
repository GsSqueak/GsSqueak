available servers
projectServers
	"ServerDirectory projectServers"

	| projectServers |
	projectServers := OrderedCollection new.
	self serverNames do: [ :n | | projectServer | 
		projectServer := ServerDirectory serverNamed: n.
		(projectServer isProjectSwiki and: [projectServer isSearchable])
			ifTrue: [projectServers add: projectServer]].
	^projectServers