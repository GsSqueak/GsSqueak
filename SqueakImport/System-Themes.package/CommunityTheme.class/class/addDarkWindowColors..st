instance creation
addDarkWindowColors: aUserInterfaceTheme
	"self createDark apply."
	aUserInterfaceTheme
		set: #uniformWindowColor for: #Model to: Color darkGray;
		
		set: #unfocusedWindowColorModifier for: #SystemWindow to: [ [:color | color darker] ];
		set: #unfocusedLabelColor for: #SystemWindow to: Color veryLightGray;
		set: #focusedLabelColor for: #SystemWindow to: Color white;

		set: #customWindowColor for: #Browser to: self dbBlue;
		set: #customWindowColor for: #ChangeList to: self dbBlue;
		set: #customWindowColor for: #ChangeSorter to: self dbBlue;
		set: #customWindowColor for: #ChatNotes to: self dbPurple twiceDarker;
		set: #customWindowColor for: #ClassCommentVersionsBrowser to: self dbPurple twiceDarker;
		set: #customWindowColor for: #Debugger to: self dbRed;
		set: #customWindowColor for: #DualChangeSorter to: self dbOrange twiceDarker;
		set: #customWindowColor for: #FileContentsBrowser to: self dbGray;
		set: #customWindowColor for: #FileList to: self dbGray;
		set: #customWindowColor for: #Inspector to: self dbYellow duller;
		set: #customWindowColor for: #InstanceBrowser to: self dbYellow duller;
		set: #customWindowColor for: #Lexicon to: self dbGreen;
		set: #customWindowColor for: #MCTool to: self dbOrange twiceDarker;
		set: #customWindowColor for: #MessageNames to: self dbGreen;
		set: #customWindowColor for: #MessageSet to: self dbGreen;
		set: #customWindowColor for: #ObjectExplorer to: self dbYellow duller;
		set: #customWindowColor for: #PackagePaneBrowser to: self dbBlue;
		set: #customWindowColor for: #PluggableFileList to: self dbGray;
		set: #customWindowColor for: #PreferenceBrowser to: self dbBlue;
		set: #customWindowColor for: #ProcesBrowser to: self dbAqua;
		set: #customWindowColor for: #SMLoader to: self dbOrange twiceDarker;
		set: #customWindowColor for: #SMLoaderPlus to: self dbOrange twiceDarker;
		set: #customWindowColor for: #SMReleaseBrowser to: self dbOrange twiceDarker;
		set: #customWindowColor for: #ScriptingDomain to: self dbYellow duller;
		set: #customWindowColor for: #SelectorBrowser to: self dbBlue;
		set: #customWindowColor for: #StringHolder to: self dbGray;
		set: #customWindowColor for: #TestRunner to: self dbPink darker;
		set: #customWindowColor for: #TranscriptStream to: self dbGray;
		set: #customWindowColor for: #VersionsBrowser to: self dbPurple twiceDarker;
		set: #customWindowColor for: #Workspace to: self dbPink darker.