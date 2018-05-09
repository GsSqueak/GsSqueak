fileIn/Out
fileOutClass: extraClass andObject: theObject 
	UTF8TextConverter writeBOMOn: self.
	^ super fileOutClass: extraClass andObject: theObject