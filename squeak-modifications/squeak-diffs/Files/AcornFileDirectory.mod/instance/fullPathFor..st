file name utilities
fullPathFor: path
	"if the arg is an empty string, just return my path name converted via the language stuff. 
If the arg seems to be a  rooted path, return it raw, assuming it is already ok.
Otherwise cons up a path"
	path isEmpty ifTrue:[^pathName asSqueakPathName].
	((path includes: $$ ) or:[path includes: $:]) ifTrue:[^path].
	^pathName asSqueakPathName, self slash, path