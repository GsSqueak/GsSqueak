as yet unclassified
navigator: aThreadNavigator listOfPages: listOfPages

	| morphsForPageSorter pixelsAvailable pixelsNeeded scale |

	"a bit of fudging to try to outguess the layout mechanism and get best possible scale"
	pixelsAvailable := Display extent - 130.
	pixelsAvailable := pixelsAvailable x * pixelsAvailable y.
	pixelsNeeded := 100@75.
	pixelsNeeded := pixelsNeeded x * pixelsNeeded y  * listOfPages size.
	scale := (pixelsAvailable / pixelsNeeded min: 1) sqrt.
	sizeOfEachMorph := (100@75 * scale) rounded.

	morphsForPageSorter := self morphsForMyContentsFrom: listOfPages sizedTo: sizeOfEachMorph.
	morphsForPageSorter := morphsForPageSorter reject: [ :each | each isNil].
	self changeExtent: Display extent.

	self
		book: aThreadNavigator 
		morphsToSort: morphsForPageSorter.
	pageHolder 
		cursor: aThreadNavigator currentIndex;
		fullBounds;
		hResizing: #rigid.

