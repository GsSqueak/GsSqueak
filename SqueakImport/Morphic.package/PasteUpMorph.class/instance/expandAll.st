world menu
expandAll
	"Expand all windows"
	(SystemWindow windowsIn: self satisfying: [:w | w isCollapsed])
		reverseDo: [:w | w collapseOrExpand.  self displayWorld]