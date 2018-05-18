accessing - icons
smallProjectJumpIcon

	^ Icons
		at: #smallProjectJumpIcon
		ifAbsentPut: [ self smallProjectJumpIconContents ]