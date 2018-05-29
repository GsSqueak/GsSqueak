navigation
editThisThread

	| sorter |

	sorter := ProjectSorterMorph new.
	sorter navigator: self listOfPages: listOfPages.
	self currentWorld addMorphFront: sorter.
	sorter align: sorter topCenter with: self currentWorld topCenter.
	self delete.

