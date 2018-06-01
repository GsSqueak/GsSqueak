menu decoration
itemsIcons
	"answer a collection of associations wordings -> icon to  
	decorate  
	the menus all over the image"
	| icons |
	icons := OrderedCollection new.

	"icons add: #('Test Runner' ) -> self smallTrafficIcon."

	" 
	world menu"
	"icons add: #('previous project' 'go to previous project') -> self smallProjectBackIcon."
	icons add: #('go to next project') -> self smallProjectNextIcon.
	icons add: #('select' ) -> self smallSelectIcon.
	icons add: #('jump to project...' ) -> self smallProjectJumpIcon.
	icons add: #('open...' ) -> self smallOpenIcon.
	icons add: #('appearance...' ) -> self smallConfigurationIcon.
	icons add: #('help...' ) -> self smallHelpIcon.
	"icons add: #('windows...' ) -> self smallWindowIcon."
	icons add: #('changes...' ) -> self smallDocumentClockIcon.
	icons add: #('print PS to file...' ) -> self smallPrintIcon.
	icons add: #('debug...' ) -> self smallDebugIcon.
	icons add: #('export...' ) -> self smallExportIcon.
	icons add: #('save' ) -> self smallSaveIcon.
	"icons add: #('save project on file...' ) -> self smallProjectSaveIcon."
	"icons add: #('save as...') -> self smallSaveAsIcon.
	icons add: #('save as new version') -> self smallSaveNewIcon.
	icons add: #('save and quit' ) -> self smallQuitIcon."
	icons add: #('quit') -> self smallQuitNoSaveIcon.
	"icons add: #('load project from file...' ) -> self smallProjectLoadIcon."
	""
	icons add: #('do it (d)' ) -> self smallDoItIcon.
	icons add: #('inspect it (i)' 'inspect world' 'explore world' 'inspect model' 'inspect morph' 'explore morph' 'inspect owner chain' 'explore' 'inspect' 'explore (I)' 'inspect (i)' 'basic inspect' ) -> self smallInspectItIcon.
	icons add: #('print it (p)' ) -> self smallPrintIcon.
	icons add: #('debug it (D)' ) -> self smallDebugIcon.
	icons add: #('tally it' ) -> self smallTimerIcon.
	""
	icons add: #('copy (c)' 'copy to paste buffer' 'copy text' ) -> self smallCopyIcon.
	icons add: #('paste (v)') -> self smallPasteIcon.
	icons add: #('cut (x)' ) -> self smallCutIcon.
	""
	icons add: #('accept (s)' 'yes' 'Yes' ) -> self smallOkIcon.
	icons add: #('cancel (l)' 'no' 'No' ) -> self smallCancelIcon.
	""
	icons add: #('redo (Z)' ) -> self smallRedoIcon.
	icons add: #('undo (z)' ) -> self smallUndoIcon.
	""
	icons add: #( 'find class... (f)' 'find method...' ) -> self smallSearchIcon.
	icons add: #('find...(f)') -> self smallFindIcon.
	""
	icons add: #('remove' 'remove (x)' 'remove class (x)' 'delete method from changeset (d)' 'remove method from system (x)' 'delete class from change set (d)' 'remove class from system (x)' 'destroy change set (X)' ) -> self smallDeleteIcon.
	icons add: #('add item...' 'new category...' 'new change set... (n)' ) -> self smallNewIcon.
	""
	icons add: #('objects (o)' ) -> self smallObjectCatalogIcon.
	icons add: #('authoring tools...')  -> self smallAuthoringToolsIcon.
	icons add: #('projects...')  -> self smallProjectIcon.
	""
	icons add: #('make screenshot')  -> self smallScreenshotIcon.
	
	""
	icons add: #('leftFlush' ) -> self smallLeftFlushIcon.
	icons add: #('rightFlush' ) -> self smallRightFlushIcon.
	icons add: #('centered' 'set alignment... (u)' ) -> self smallCenteredIcon.
	icons add: #('justified' ) -> self smallJustifiedIcon.
	""
	icons add: #('set font... (k)' 'list font...' 'set subtitles font' 'change font' 'system fonts...' 'change font...' 'default text font...' 'flaps font...' 'eToys font...' 'eToys title font...' 'halo label font...' 'menu font...' 'window-title font...' 'balloon-help font...' 'code font...' 'button font...') -> self smallFontsIcon.
	icons add: #('full screen on') -> self smallFullscreenOnIcon.
	icons add: #('full screen off' ) -> self smallFullscreenOffIcon.
	""
	^ icons