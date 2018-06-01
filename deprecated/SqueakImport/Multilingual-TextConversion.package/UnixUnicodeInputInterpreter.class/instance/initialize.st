initialization
initialize
	| satisfiesVersion launcherClass |
	launcherClass := Smalltalk at: #SugarLaunche  ifAbsent: [nil].
	satisfiesVersion := launcherClass notNil and: [launcherClass current isRunningInSugar].
	satisfiesVersion
		ifTrue: [keyValueIndex := 6]
		ifFalse: [keyValueIndex := 6  "it might have to be 3, but probably different logic to check the VM version would be better."]