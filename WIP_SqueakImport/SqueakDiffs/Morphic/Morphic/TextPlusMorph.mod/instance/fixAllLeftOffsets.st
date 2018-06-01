as yet unclassified
fixAllLeftOffsets

	

	text runs withStartStopAndValueDo: [:start :stop :attributes |
		attributes do: [:att | | am |
			(att isMemberOf: TextAnchor) ifTrue: [
				am := att anchoredMorph.
				(am isNil or: [am world isNil]) ifFalse: [
					am 
						valueOfProperty: #geeMailLeftOffset 
						ifAbsent: [
							am setProperty: #geeMailLeftOffset toValue: am left - self left
						]
				]
			]
		]
	].

