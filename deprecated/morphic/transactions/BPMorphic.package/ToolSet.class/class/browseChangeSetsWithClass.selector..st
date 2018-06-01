browsing
browseChangeSetsWithClass: aClass selector: aSelector 
	"Browse all the change sets with the given class/selector"
	self default
		ifNil: [^ self inform: 'No ChangeSorter present'].
	^ self default browseChangeSetsWithClass: aClass selector: aSelector