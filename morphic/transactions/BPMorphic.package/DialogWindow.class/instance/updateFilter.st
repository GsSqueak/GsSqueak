updating
updateFilter
	self buttons
		do: [:ea | ea
				enabled: (self filter isEmpty
						or: [ea label asString includesSubstring: self filter caseSensitive: false])].
	filterMorph visible: self filter notEmpty;
		 disableTableLayout: self filter isEmpty;
		 contents: '<' , self filter , '>';
		 textColor: self messageMorph textColor.
	self ensureSelectedButton