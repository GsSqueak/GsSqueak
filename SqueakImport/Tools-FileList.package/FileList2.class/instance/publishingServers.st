initialization
publishingServers

	| dirList |

	dirList := OrderedCollection new.
	ServerDirectory serverNames do: [ :n | | dir nameToShow | 
		dir := ServerDirectory serverNamed: n.
		(dir isProjectSwiki and: [dir acceptsUploads])
			 ifTrue: [
				nameToShow := n.
				dirList add: ((dir directoryWrapperClass with: dir name: nameToShow model: self)
					balloonText: dir realUrl)]].
	^dirList