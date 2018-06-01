accessing
versionCode
    "Answer a number representing the 'version' of the ReferenceStream facility; this is stashed at the beginning of ReferenceStreams, as a secondary versioning mechanism (the primary one is the fileTypeCode).   At present, it serves for information only, and is not checked for compatibility at reload time, but could in future be used to branch to variant code. "

	" 1 = original version 1992"
	" 2 = HyperSqueak.  PathFromHome used for Objs outside the tree.  SqueakSupport SysLibrary for shared globals like Display and StrikeFonts.  File has version number, class structure, then an IncomingObjects manager.  8/16/96 tk.  
	Extended to SmartRefStream.  class structure also keeps superclasse chain.  Does analysis on structure to see when translation methods are needed.  Embedable in file-ins.  (factored out HyperSqueak support)  Feb-May 97 tk"
	" 3 = Reference objects are byte offsets relative to the start of the object portion of the file.  Rectangles with values -2048 to 2047 are encoded compactly."
	" 4 = If UniClasses (subclasses of Player) have class instance variables, append their values in the form (#Class43 (val1 val2 vla3)).  An array of those.  Can still read version 3."
	^ 4