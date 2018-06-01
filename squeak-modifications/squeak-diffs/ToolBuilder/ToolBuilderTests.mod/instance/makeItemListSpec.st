tests-lists
makeItemListSpec
	| spec |
	spec := builder pluggableListSpec new.
	spec name: #list.
	spec model: self.
	spec list: #getList.
	spec getSelected: #getListSelection.
	"<-- the following cannot be tested very well -->"
	spec setSelected: #setListSelection:.
	spec menu: #getMenu:.
	spec keyPress: #keyPress:.
	^spec