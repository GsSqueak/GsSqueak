button actions
loadSqueak

	| defaultPath defaultDirectory dir |
	defaultPath := OSProcess thisOSProcess environmentAt: #'GS_HOME'.
	defaultPath := defaultPath , '/shared/repos/BP2017RH1/WIP_SqueakImport/SqueakDiffs'.
	defaultDirectory := FileDirectory uri: defaultPath.
	defaultDirectory exists ifFalse: [defaultDirectory := FileDirectory uri: (OSProcess thisOSProcess environmentAt: #'HOME')].
	dir := UIManager default
		chooseDirectory: 'Choose directory'
		from: defaultDirectory.
	self loadSqueakFrom: dir