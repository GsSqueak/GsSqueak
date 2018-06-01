authentication
encode: nameString password: pwdString
	"Encode per RFC1421 of the username:password combination."

	^(nameString, ':', pwdString) base64Encoded