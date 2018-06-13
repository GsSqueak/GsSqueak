wrapper
login: stoneNRS gemNRS: gemNRS gemstoneUser: gemstoneUsername gemstonePassword: gemstonePassword gemstonePasswordIsEncrypted: gemstonePasswordIsEncrypted

	^ self
		login: stoneNRS
		hostUser: nil
		hostPassword: nil
		hostPasswordIsEncrypted: false
		gemNRS: gemNRS
		gemstoneUser: gemstoneUsername
		gemstonePassword: gemstonePassword
		gemstonePasswordIsEncrypted: gemstonePasswordIsEncrypted