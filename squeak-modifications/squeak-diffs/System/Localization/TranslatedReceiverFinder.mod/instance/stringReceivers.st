accessing
stringReceivers
	"TranslatedReceiverFinder new stringReceivers"
	| stringReceivers messages |
	messages := Set new.
	(SystemNavigation default allCallsOn: #translated)
		do: [:message | self search: #translated messageNode: message decompile addTo: messages].
	stringReceivers := messages
				select: [:each | each receiver isMemberOf: LiteralNode]
				thenCollect: [:each | each receiver key].
	^ stringReceivers asArray sort