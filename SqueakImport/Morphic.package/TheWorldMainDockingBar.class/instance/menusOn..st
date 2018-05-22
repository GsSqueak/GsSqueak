construction
menusOn: aDockingBar

	self class showMainMenuInWorldMainDockingBar ifTrue: [
		self squeakMenuOn: aDockingBar].

	self class showProjectsMenuInWorldMainDockingBar ifTrue: [
		self projectsMenuOn: aDockingBar].

	self class showToolsMenuInWorldMainDockingBar ifTrue: [
		self toolsMenuOn: aDockingBar].

	self class showAppsMenuInWorldMainDockingBar ifTrue: [
		self appsMenuOn: aDockingBar].

	self class showDoMenuInWorldMainDockingBar ifTrue: [
		self doMenuOn: aDockingBar].

	self class showExtrasMenuInWorldMainDockingBar ifTrue: [
		self extrasMenuOn: aDockingBar].

	self class showWindowsMenuInWorldMainDockingBar ifTrue: [
		self windowsMenuOn: aDockingBar].

	self class showHelpMenuInWorldMainDockingBar ifTrue: [
		self helpMenuOn: aDockingBar].