testing
queryProjectsAndShow
	| result |
"SuperSwikiServer testOnlySuperSwiki queryProjectsAndShow"

	result := self sendToSwikiProjectServer: {
		'action: findproject'.
		"'projectname: *proj*'."
	}.
	(result beginsWith: 'OK') ifFalse: [^self inform: result printString].
	self showQueryAsPVM: (ReadStream on: result).
