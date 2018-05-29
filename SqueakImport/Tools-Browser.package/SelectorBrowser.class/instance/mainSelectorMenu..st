selector list
mainSelectorMenu: aMenu

	<selectorMenu>
	^ aMenu addList: #(
			('senders (n)'					senders)
			('implementors (m)'				implementors)
			('copy selector to clipboard'	copyName));
		yourself
