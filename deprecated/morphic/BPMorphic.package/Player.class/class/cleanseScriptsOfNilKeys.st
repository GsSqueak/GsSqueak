housekeeping
cleanseScriptsOfNilKeys
	"If, owing to an earlier bug, the receiver's scripts dictionary has a nil
	key, remove that offender before he causes more trouble"
	scripts
		ifNotNil: [scripts
				removeKey: nil
				ifAbsent: []]