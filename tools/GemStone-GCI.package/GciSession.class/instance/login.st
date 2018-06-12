initialize-release
login

	sessionHandle := self gciLibrary
						login: self sessionDescription stoneNRS
						hostUser: self sessionDescription osUser
						hostPassword: self sessionDescription osPassword
						hostPasswordIsEncrypted: false
						gemNRS: self sessionDescription gemNRS
						gemstoneUser: self sessionDescription userID
						gemstonePassword: self sessionDescription password
						gemstonePasswordIsEncrypted: false