tests-trees
makeTreeSpec
	| spec |
	spec := builder pluggableTreeSpec new.
	spec name: #tree.
	spec model: self.
	spec roots: #getRoots.
	"<-- the following cannot be tested very well -->"
	spec getSelectedPath: #getTreeSelectionPath.
	spec getChildren: #getChildrenOf:.
	spec hasChildren: #hasChildren:.
	spec label: #getLabelOf:.
	spec icon: #getIconOf:.
	spec help: #getHelpOf:.
	spec setSelected: #setTreeSelection:.
	spec menu: #getMenu:.
	spec keyPress: #keyPress:.
	^spec