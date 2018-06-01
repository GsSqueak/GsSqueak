widgets required
buildPluggableText: aSpec
	| widget |
	widget := PluggableTextView on: aSpec model
				text: aSpec getText 
				accept: aSpec setText
				readSelection: aSpec selection 
				menu: aSpec menu.
	self register: widget id: aSpec name.
	self setFrame: aSpec frame in: widget.
	parent ifNotNil:[parent addSubView: widget].
	panes ifNotNil:[
		aSpec getText ifNotNil:[panes add: aSpec getText].
	].
	^widget