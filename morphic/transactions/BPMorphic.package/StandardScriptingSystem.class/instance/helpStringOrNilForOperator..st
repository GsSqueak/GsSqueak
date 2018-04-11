-Etoys-utilities
helpStringOrNilForOperator: anOperator 
	"Answer the help string associated with the given operator, nil if none
	found. "
	| _gsSqueakTemp_anIndex _gsSqueakTemp_opsAndHelp |
	(_gsSqueakTemp_anIndex := (_gsSqueakTemp_opsAndHelp := self arithmeticalOperatorsAndHelpStrings) first indexOf: anOperator) > 0
		ifTrue: [^ (_gsSqueakTemp_opsAndHelp second at: _gsSqueakTemp_anIndex) translated].
	(_gsSqueakTemp_anIndex := (_gsSqueakTemp_opsAndHelp := self numericComparitorsAndHelpStrings) first indexOf: anOperator) > 0
		ifTrue: [^ (_gsSqueakTemp_opsAndHelp second at: _gsSqueakTemp_anIndex) translated].
	anOperator = #,
		ifTrue: [^ 'Concatenate two Strings' translated].
	^ nil