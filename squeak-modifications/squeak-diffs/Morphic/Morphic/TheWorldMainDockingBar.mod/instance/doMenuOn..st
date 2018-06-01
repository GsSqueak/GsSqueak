construction
doMenuOn: aDockingBar 

	aDockingBar addItem: [ :item |
		item
			contents: 'Do' translated;
			subMenuUpdater: self
			selector: #listCommonRequestsOn: ]