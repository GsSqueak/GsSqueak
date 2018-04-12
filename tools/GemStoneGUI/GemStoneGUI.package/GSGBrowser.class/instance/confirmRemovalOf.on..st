message list
confirmRemovalOf: aSelector on: aClass 
	"Determine if it is okay to remove the given selector."
	| count answer caption allCalls |
	self flag: #gsg2.
	true ifTrue: [^ true].
	allCalls := self allCallsOn: aSelector.
	"no senders -- let the removal happen without warning"
	allCalls ifEmpty: [^ true].
	"only sender is itself"
	count := allCalls size.
	(count = 1 and: [allCalls first = self currentMethod]) ifTrue: [^ true].
	caption := 'The message "{1}" has {2} sender{3}.' 
				format: {aSelector. count. count > 1 ifTrue: ['s'] ifFalse: ['']}.
	answer := UIManager default
		chooseFrom: #('Remove it'
				'Remove, then browse senders'
				'Don''t remove, but show me those senders'
				'Forget it -- do nothing -- sorry I asked') title: caption.
	(answer = 3 or: [answer = 2])
		ifTrue: [self
				browseMessageList: allCalls
				name: 'Senders of ' , aSelector
				autoSelect: aSelector keywords first].
	^ answer <= 2