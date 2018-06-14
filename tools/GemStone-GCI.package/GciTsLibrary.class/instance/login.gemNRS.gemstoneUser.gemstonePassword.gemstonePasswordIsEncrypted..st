wrapper
login: stoneNRS gemNRS: gemNRS gemstoneUser: gemstoneUsername gemstonePassword: gemstonePassword gemstonePasswordIsEncrypted: gemstonePasswordIsEncrypted

	^ self
		login: stoneNRS
		hostUser: ''
		hostPassword: ''
		hostPasswordIsEncrypted: false
		gemNRS: gemNRS
		gemstoneUser: gemstoneUsername
		gemstonePassword: gemstonePassword
		gemstonePasswordIsEncrypted: gemstonePasswordIsEncrypted