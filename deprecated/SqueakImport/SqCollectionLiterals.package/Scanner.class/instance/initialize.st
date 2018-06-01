initialize-release
initialize

	super initialize.
	buffer := WriteStream on: (String new: 40).
	typeTable := TypeTable