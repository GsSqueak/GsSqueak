installation
install

	zip := ZipArchive new.
	zip readFrom: stream.
	self checkDependencies ifFalse: [^false].
	self recordVersionInfo.
	(zip membersMatching: 'snapshot/*') 
		sort: [:a :b | a fileName < b fileName];
		do: [:src | self installMember: src].