instance creation
newOnClass: aClass messageCategory: aCategory

	^ self newOnClass: aClass messageCategory: aCategory editString: nil label: 'Message Category Browser (' , aClass name, ')'.