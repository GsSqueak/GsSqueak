instances
forClass: aClass

	^ self organizationDict
		at: aClass
		ifAbsentPut: [self class: aClass defaultList: aClass methodDict keys sort]
