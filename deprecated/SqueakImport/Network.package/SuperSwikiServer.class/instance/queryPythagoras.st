testing
queryPythagoras
"SuperSwikiServer testOnlySuperSwiki queryPythagoras"

	^self sendToSwikiProjectServer: {
		'action: findproject'.
		'projectsubcategory: *geometry*'.
		"'projectname: *pythagoras*'."
	}