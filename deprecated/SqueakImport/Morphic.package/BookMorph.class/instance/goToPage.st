menu
goToPage
	| pageNum |
	pageNum := UIManager default request: 'Page?' translated initialAnswer: '0'.
	pageNum isEmptyOrNil ifTrue: [^true].
	self goToPage: pageNum asNumber.
