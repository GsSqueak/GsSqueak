(PackageInfo named: 'Morphic') preamble: 'SimpleBorder allSubInstancesDo: [ :each |
	(each instVarNamed: #width) ifNil: [ each instVarNamed: #width put: 0 ].
	(each instVarNamed: #color) ifNil: [ each instVarNamed: #color put: Color transparent ].
	(each instVarNamed: #baseColor) ifNil: [ each instVarNamed: #baseColor put: Color transparent ] ].'!
