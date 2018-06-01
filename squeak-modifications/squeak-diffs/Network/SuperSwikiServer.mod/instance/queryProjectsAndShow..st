testing
queryProjectsAndShow: thingsToSearchFor
	| result |
"SuperSwikiServer testOnlySuperSwiki queryProjectsAndShow"

	result := self sendToSwikiProjectServer: {
		'action: findproject'.
	}, thingsToSearchFor.
	(result beginsWith: 'OK') ifFalse: [^self inform: result printString].
	self showQueryAsPVM: (ReadStream on: result).
