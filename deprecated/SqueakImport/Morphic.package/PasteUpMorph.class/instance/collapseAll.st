world menu
collapseAll
	"Collapse all windows"
	(SystemWindow windowsIn: self satisfying: [:w | w isCollapsed not])
		reverseDo: [:w | w collapseOrExpand.  self displayWorld].
	self collapseNonWindows