dependency sorting
requirements

	| requirements |
	requirements := OrderedCollection new.
	self loadedGemstoneName ifNotNil: [requirements add: #Class].
	self loadedSuperclass ifNotNil: [:cls | requirements add: cls].
	^ requirements asArray