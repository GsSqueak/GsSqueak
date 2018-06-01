tests-lists
makeListSpec
	| spec |
	spec := builder pluggableListSpec new.
	spec name: #list.
	spec model: self.
	spec list: #getList.
	spec getIndex: #getListIndex.
	"<-- the following cannot be tested very well -->"
	spec setIndex: #setListIndex:.
	spec menu: #getMenu:.
	spec keyPress: #keyPress:.
	^spec