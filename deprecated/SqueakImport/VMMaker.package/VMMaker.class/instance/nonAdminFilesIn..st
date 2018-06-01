processing external files
nonAdminFilesIn: directory 
	"Answer file names in directory tree, excluding those associated with
	version control systems"
	^ directory fullNamesOfAllFilesInSubtree
		reject: [:el | (el findString: 'CVS' startingAt: 1) ~= 0
				or: [(el findString: '.svn' startingAt: 1) ~= 0]]