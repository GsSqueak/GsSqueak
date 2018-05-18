dependency sorting
requirements

	| requirements |
	requirements := OrderedCollection new.
	self gemstoneName ifNotNil: [requirements add: #Class].
	self superclass ifNotNil: [:cls | requirements add: cls].
	^ requirements asArray