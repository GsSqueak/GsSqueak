instance creation
addDarkWindowColors: theme
	"self createDark apply."
	theme
		set: #uniformWindowColor for: #Model to:( self invisibleColor adjustBrightness: 0.16) "lighter twice";
		
		set: #unfocusedWindowColorModifier for: #SystemWindow to: [ [:color | color adjustBrightness: -0.16 "darker twice"] ];
		set: #unfocusedLabelColor for: #SystemWindow to: [
			Model useColorfulWindows
				ifTrue: [(Color r: 0.285 g: 0.282 b: 0.242) "invisible color"]
				ifFalse: [(Color r: 0.972 g: 0.972 b: 0.948) "foreground color"] ];
		set: #focusedLabelColor for: #SystemWindow to: [
			Model useColorfulWindows
				ifTrue: [(Color r: 0.152 g: 0.156 b: 0.133) "background color"]
				ifFalse: [(Color r: 0.901 g: 0.858 b: 0.455) "yellow"] ];

		set: #customWindowColor for: #Browser to: self green duller;
		set: #customWindowColor for: #ChangeList to: self blue duller;
		set: #customWindowColor for: #ChangeSorter to: self blue duller;
		set: #customWindowColor for: #ChatNotes to: self magenta duller;
		set: #customWindowColor for: #ClassCommentVersionsBrowser to: self violet duller;
		set: #customWindowColor for: #Debugger to: self red duller;
		set: #customWindowColor for: #DualChangeSorter to: self blue duller;
		set: #customWindowColor for: #FileContentsBrowser to: self yellow duller;
		set: #customWindowColor for: #FileList to: self yellow duller;
		set: #customWindowColor for: #InstanceBrowser to: self cyan duller;
		set: #customWindowColor for: #Lexicon to: self cyan duller;
		set: #customWindowColor for: #MCTool to: self violet duller;
		set: #customWindowColor for: #MessageNames to: self green duller;
		set: #customWindowColor for: #MessageSet to: self cyan duller;
		set: #customWindowColor for: #PackagePaneBrowser to: self green duller;
		set: #customWindowColor for: #PluggableFileList to: self yellow duller;
		set: #customWindowColor for: #PreferenceBrowser to: self cyan duller;
		set: #customWindowColor for: #SMLoader to: self orange duller;
		set: #customWindowColor for: #SMLoaderPlus to: self orange duller;
		set: #customWindowColor for: #SMReleaseBrowser to: self orange duller;
		set: #customWindowColor for: #ScriptingDomain to: self yellow duller;
		set: #customWindowColor for: #SelectorBrowser to: self cyan duller;
		set: #customWindowColor for: #StringHolder to: self yellow duller;
		set: #customWindowColor for: #TestRunner to: self orange duller;
		set: #customWindowColor for: #TranscriptStream to: self orange duller;
		set: #customWindowColor for: #VersionsBrowser to: self violet duller.