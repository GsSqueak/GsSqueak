navigation
goToPageMorph: aMorph fromBookmark: aBookmark
	"This protocol enables sensitivity to a transitionSpec on the bookmark"
	
	self goToPageMorph: aMorph
		transitionSpec: (aBookmark valueOfProperty: #transitionSpec).
