private
preMerge: aUserInterfaceTheme 
	name := name , ' + ' , aUserInterfaceTheme name.
	next ifNil: [ next := aUserInterfaceTheme next ]