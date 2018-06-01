booksAsProjects
makeBookOfProjects: aListOfProjects named: aString 
	"
	BookMorph makeBookOfProjects: (Project allProjects select: [ :each |
	each world isMorph]
	"
	| _gsSqueakTemp_book |
	_gsSqueakTemp_book := self new.
	_gsSqueakTemp_book setProperty: #transitionSpec toValue: {'silence'. #none. #none}.
	aListOfProjects
		do: [:each | 
			| pvm page |
			pvm := ProjectViewMorph on: each.
			page := PasteUpMorph new addMorph: pvm;
						 extent: pvm extent.
			_gsSqueakTemp_book insertPage: page pageSize: page extent].
	_gsSqueakTemp_book goToPage: 1.
	_gsSqueakTemp_book deletePageBasic.
	_gsSqueakTemp_book setProperty: #nameOfThreadOfProjects toValue: aString.
	_gsSqueakTemp_book removeProperty: #transitionSpec.
	_gsSqueakTemp_book openInWorld