initialization
initialDirectoryList

	| dirList |
	dirList := (FileDirectory on: '') directoryNames collect: [ :each |
		FileDirectoryWrapper with: (FileDirectory on: each) name: each model: self].
	dirList isEmpty ifTrue:[
		dirList := Array with: (FileDirectoryWrapper 
			with: FileDirectory default 
			name: FileDirectory default localName 
			model: self)].
	dirList := dirList,(
		ServerDirectory serverNames collect: [ :n | | nameToShow dir | 
			dir := ServerDirectory serverNamed: n.
			nameToShow := n.
			(dir directoryWrapperClass with: dir name: nameToShow model: self)
				balloonText: dir realUrl
		]
	).
	^dirList