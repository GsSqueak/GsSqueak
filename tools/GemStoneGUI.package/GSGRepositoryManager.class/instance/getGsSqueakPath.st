GsSqueak
getGsSqueakPath

	| defaultPath defaultDirectory |
	defaultPath := (OSProcess thisOSProcess environmentAt: #'GS_HOME')
						ifNil: [Smalltalk imagePath]
						ifNotNil: [:path | path , '/shared/repos/BP2017RH1/WIP_SqueakImport/SqueakDiffs'].
	defaultDirectory := FileDirectory uri: defaultPath.
	defaultDirectory exists ifFalse: [defaultDirectory := FileDirectory uri: Smalltalk imagePath].
	^ UIManager default
		chooseDirectory: 'Choose directory'
		from: defaultDirectory