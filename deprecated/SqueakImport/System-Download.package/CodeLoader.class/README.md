CodeLoader provides a simple facility for loading code from the network.

CodeLoader has a very specific purpose, primarily for loading Etoys projects. It is not meant to be used for anything else. Use Installer for general purposes.

Examples:
	| loader |
	loader := CodeLoader new.
	loader baseURL:'http://isgwww.cs.uni-magdeburg.de/~raab/test/'.
	loader localCache: #('.cache' 'source').
	"Sources and segments can be loaded in parallel"
	loader loadSourceFiles: #('file1.st' 'file2.st.gz').
	loader localCache: #('.cache' 'segments').
	loader loadSegments: #('is1.extseg' 'is2.extseg.gz').
	"Install sources first - will wait until the files are actually loaded"
	loader installSourceFiles.
	"And then the segments"
	loader installSegments.