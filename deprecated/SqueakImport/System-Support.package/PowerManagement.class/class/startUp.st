startup logic
startUp
	[Preferences turnOffPowerManager
		ifTrue: [self disablePowerManager]]
		ifError: []