platform specific
isActiveDirectoryClass
	"Does this class claim to be that properly active subclass of FileDirectory  
	for the current platform? On Acorn, the test is whether platformName 
	is 'RiscOS' (on newer VMs) or if the primPathNameDelimiter is $. (on
	older ones), which is what we would like to use for a dirsep if only it
	would work out. See pathNameDelimiter for more woeful details - then
	just get on and enjoy Squeak"

	^ Smalltalk platformName = 'RiscOS'
		or: [self primPathNameDelimiter = $.]