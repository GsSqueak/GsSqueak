support windows
standardWorkspaceContents
	^ self class firstCommentAt: #standardWorkspaceContents

	"ChangeList browseRecentLog.
ChangeList browseRecent: 2000.

Preferences editAnnotations.
Flaps reinstateDefaultFlaps. 

(FileStream oldFileNamed: 'Lives of the Wolves') edit.
(FileStream oldFileNamed: 'tuesdayFixes.cs') fileIn.
ChangeList browseFile: 'myChanges.st'.

TextStyle default fontAt: 7 put: (StrikeFont new readMacFontHex: 'Cairo 18').

StandardSystemView doCacheBits.  ""restore fast windows mode in mvc""

Symbol selectorsContaining: 'rsCon'.
SystemNavigation default browseMethodsWhoseNamesContain: 'screen'.

Browser newOnClass: Utilities.
Browser fullOnClass: SystemDictionary.

FormView allInstances inspect.
StandardSystemView someInstance inspect.

Utilities storeTextWindowContentsToFileNamed: 'TextWindows'.

ScriptingSystem resetStandardPartsBin.

SystemOrganization categoryOfElement: #Controller. 
ParagraphEditor organization categoryOfElement: #changeEmphasis.

Cursor wait showWhile: [Sensor waitButton].

Smalltalk bytesLeft asStringWithCommas.
ByteSymbol instanceCount.
Time millisecondsToRun:
	[SystemNavigation default allCallsOn: #asOop].
MessageTally spyOn: [SystemNavigation default allCallsOn: #asOop].

"

"Utilities openStandardWorkspace"