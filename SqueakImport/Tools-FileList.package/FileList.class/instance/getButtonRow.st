toolbuilder
getButtonRow
	"Answer the dynamic button row to use for the currently selected item."
	| builder svc |
	builder := ToolBuilder default.
	svc := self universalButtonServices.
	self fileListIndex = 0 ifFalse:[svc := svc, self dynamicButtonServices].
	^svc collect:[:service| service buildWith: builder in: self].