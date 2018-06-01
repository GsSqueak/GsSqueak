scrolling
hUnadjustedScrollRange
"Return the width of the widest item in the list"

	| max count |

	max := 0.
	count := 0.
	scroller submorphsDo: [ :each | | stringW right |
		stringW := each font widthOfStringOrText: each contents.
		right := (each toggleRectangle right + stringW + 10).
		max := max max: right.
		
"NOTE: need to optimize this method by caching list item morph widths (can init that cache most efficiently in the #list: method before the item widths are reset to 9999).  For now, just punt on really long lists"
		((count := count + 1) > 200) ifTrue:[ ^max * 3].
	].

	^max 
