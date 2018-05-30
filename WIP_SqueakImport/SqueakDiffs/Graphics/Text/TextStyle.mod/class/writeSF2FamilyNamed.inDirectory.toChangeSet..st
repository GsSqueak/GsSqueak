*System-Changes-mime file in/out
writeSF2FamilyNamed: familyName inDirectory: directoryName toChangeSet: csName 
	"
	TextStyle writeSF2FamilyNamed: 'Accuny' inDirectory: 'AccunyCorrectedFeb252004Beta Folder' toChangeSet: 'AccunyInstall'.
	"

	|  family |
	family := OrderedCollection new.
	family addAll: (StrikeFont readStrikeFont2Family: familyName fromDirectory: (FileDirectory default fullNameFor: directoryName)) .
	family do: [:f | f reset].
	self 
		writeStyle: (TextStyle fontArray: family asArray)
		named: familyName
		toChangeSet: csName