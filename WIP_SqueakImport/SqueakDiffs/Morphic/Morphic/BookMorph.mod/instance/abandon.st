submorphs-add/remove
abandon
	"Like delete, but we really intend not to use this morph again.  Make the page cache release the page object."

	
	self delete.
	pages do: [:aPage | | pg |
		(pg := aPage sqkPage) ifNotNil: [
			pg contentsMorph == aPage ifTrue: [
					pg contentsMorph: nil]]].