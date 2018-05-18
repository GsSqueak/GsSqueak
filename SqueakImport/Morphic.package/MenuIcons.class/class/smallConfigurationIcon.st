accessing - icons
smallConfigurationIcon

	^ Icons
		at: #smallConfigurationIcon
		ifAbsentPut: [ self smallConfigurationIconContents ]