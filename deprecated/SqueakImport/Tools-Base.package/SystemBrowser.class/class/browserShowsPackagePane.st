preferences
browserShowsPackagePane
	<preference: 'Browser shows package pane' category: 'browsing' description: 'If true, then the various ''browse full'' and ''browse it'' commands (usually invoked via cmd-b) will open a Package Browser rather than a System Browser.  The Package Browser includes a package pane which groups system categories into packages based on the initial portion of their category name.' type: #Boolean>
	^ SystemNavigation default browserClass == PackagePaneBrowser.