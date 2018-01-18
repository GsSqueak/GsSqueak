events-accessing
actionMap	"Answer an action map"	| actionMap |	actionMap := self valueOfProperty: #actionMap.	actionMap		ifNil: [actionMap := self createActionMap].	^ actionMap