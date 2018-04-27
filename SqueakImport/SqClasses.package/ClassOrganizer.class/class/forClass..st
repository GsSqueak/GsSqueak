instances
forClass: aClass

	^ self organizerDict
		at: aClass
		ifAbsentPut: [self class: aClass defaultList: aClass methodDict keys sort]
