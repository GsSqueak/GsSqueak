instance creation
addLightWindowColors: theme
	"You have to create dark first.
	doIt: [self createDark. self createLight apply.]"

	theme
		set: #uniformWindowColor for: #Model to: (self lightBackgroundHighlights adjustBrightness: -0.16 "darker twice");

		set: #unfocusedWindowColorModifier for: #SystemWindow to: [ [:color | color adjustBrightness: 0.16 "lighter twice"] ];
		set: #unfocusedLabelColor for: #SystemWindow to: self lightContentEmphasized;
		set: #focusedLabelColor for: #SystemWindow to: self lightContentEmphasizedMore;

		set: #customWindowColor for: #Browser to: self green;
		set: #customWindowColor for: #ChangeList to: self blue;
		set: #customWindowColor for: #ChangeSorter to: self blue;
		set: #customWindowColor for: #ChatNotes to: self magenta;
		set: #customWindowColor for: #ClassCommentVersionsBrowser to: self violet;
		set: #customWindowColor for: #Debugger to: self red;
		set: #customWindowColor for: #DualChangeSorter to: self blue;
		set: #customWindowColor for: #FileContentsBrowser to: self yellow;
		set: #customWindowColor for: #FileList to: self yellow;
		set: #customWindowColor for: #InstanceBrowser to: self cyan;
		set: #customWindowColor for: #Lexicon to: self cyan;
		set: #customWindowColor for: #MCTool to: self violet;
		set: #customWindowColor for: #MessageNames to: self green;
		set: #customWindowColor for: #MessageSet to: self cyan;
		set: #customWindowColor for: #PackagePaneBrowser to: self green;
		set: #customWindowColor for: #PluggableFileList to: self yellow;
		set: #customWindowColor for: #PreferenceBrowser to: self cyan;
		set: #customWindowColor for: #SMLoader to: self orange;
		set: #customWindowColor for: #SMLoaderPlus to: self orange;
		set: #customWindowColor for: #SMReleaseBrowser to: self orange;
		set: #customWindowColor for: #ScriptingDomain to: self yellow;
		set: #customWindowColor for: #SelectorBrowser to: self cyan;
		set: #customWindowColor for: #StringHolder to: self yellow;
		set: #customWindowColor for: #TestRunner to: self orange;
		set: #customWindowColor for: #TranscriptStream to: self orange;
		set: #customWindowColor for: #VersionsBrowser to: self violet.