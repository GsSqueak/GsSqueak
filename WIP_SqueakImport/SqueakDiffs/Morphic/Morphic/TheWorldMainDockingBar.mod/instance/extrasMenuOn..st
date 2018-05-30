submenu - extras
extrasMenuOn: aDockingBar 

	aDockingBar addItem: [ :it|
		it 	contents: 'Extras' translated;
			addSubMenu: [:menu|
				menu addItem:[:item|
					item
						contents: 'Recover Changes' translated;
						help: 'Recover changes after a crash' translated;
						icon: MenuIcons smallDocumentClockIcon;
						target: ChangeList;
						selector: #browseRecentLog].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Themes & Colors' translated;
						subMenuUpdater: self
						selector: #themesAndWindowColorsOn: ].
				menu addItem:[:item|
					item
						contents: 'Language' translated;
						subMenuUpdater: self
						selector: #languageTranslatorsOn: ].
				menu addItem:[:item|
					item
						contents: 'Set Author Initials' translated;
						help: 'Sets the author initials' translated;
						icon: MenuIcons smallUserQuestionIcon;
						target: Utilities;
						selector: #setAuthorInitials].
				menu addItem:[:item|
					item
						contents: 'Restore Display (r)' translated;
						help: 'Redraws the entire display' translated;
						target: Project current;
						selector: #restoreDisplay].
				menu addItem:[:item|
					item
						contents: 'Rebuild Menus' translated;
						help: 'Rebuilds the menu bar' translated;
						target: TheWorldMainDockingBar;
						selector: #updateInstances].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Start Profiler' translated;
						help: 'Starts the profiler' translated;
						icon: MenuIcons smallTimerIcon;
						target: self;
						selector: #startMessageTally].
				menu addItem:[:item|
					item
						contents: 'Collect Garbage' translated;
						help: 'Run the garbage collector and report space usage' translated;
						target: Utilities;
						selector: #garbageCollectAndReport].
				menu addItem:[:item|
					item
						contents: 'Purge Undo Records' translated;
						help: 'Save space by removing all the undo information remembered in all projects' translated;
						target: CommandHistory;
						selector: #resetAllHistory].
				menu addItem:[:item|
					item
						contents: 'VM statistics' translated;
						help: 'Virtual Machine information' translated;
						target: self;
						selector: #vmStatistics].
				menu addLine.
				menu addItem:[:item|
					item
						contents: 'Graphical Imports' translated;
						help: 'View the global repository called ImageImports; you can easily import external graphics into ImageImports via the FileList' translated;
						target: (Imports default);
						selector: #viewImages].
				menu addItem:[:item|
					item
						contents: 'Standard Graphics Library' translated;
						help: 'Lets you view and change the system''s standard library of graphics' translated;
						target: ScriptingSystem;
						selector: #inspectFormDictionary].
				menu addItem:[:item|
					item
						contents: 'Annotation Setup' translated;
						help: 'Click here to get a little window that will allow you to specify which types of annotations, in which order, you wish to see in the annotation panes of browsers and other tools' translated;
						target: Preferences;
						selector: #editAnnotations].
				menu addItem:[:item|
					item
						contents: 'Browse My Changes' translated;
						help: 'Browse all of my changes since the last time #condenseSources was run.' translated;
						target: SystemNavigation new;
						selector: #browseMyChanges].
			] ]