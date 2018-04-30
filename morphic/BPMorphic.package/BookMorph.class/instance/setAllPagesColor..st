accessing
setAllPagesColor: aColor 
	"Set the color of all the pages to a new color"
	self pages
		do: [:page | page color: aColor]