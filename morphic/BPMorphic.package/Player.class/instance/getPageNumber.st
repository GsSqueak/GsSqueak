slot getters/setters
getPageNumber
	"Answer the current page number of my book"
	| _gsSqueakTemp_aBook |
	^ (_gsSqueakTemp_aBook := self bookEmbodied) pageNumberOf: _gsSqueakTemp_aBook currentPage