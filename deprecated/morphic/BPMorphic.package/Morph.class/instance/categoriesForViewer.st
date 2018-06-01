-Etoys
categoriesForViewer
	"Answer a list of symbols representing the categories to offer in the 
	viewer, in order"
	| _gsSqueakTemp_dict |
	_gsSqueakTemp_dict := Dictionary new.
	self unfilteredCategoriesForViewer
		withIndexDo: [:cat :index | _gsSqueakTemp_dict at: cat put: index].
	self filterViewerCategoryDictionary: _gsSqueakTemp_dict.
	^ _gsSqueakTemp_dict keys asArray
		sort: [:a :b | (_gsSqueakTemp_dict at: a)
				< (_gsSqueakTemp_dict at: b)]