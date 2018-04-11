-Etoys-font & color choices
statusColorSymbolFor: statusSymbol 
	#(#(#normal #green ) #(#ticking #blue ) #(#paused #red ) #(#mouseDown #yellow ) #(#mouseStillDown #lightYellow ) #(#mouseUp #lightBlue ) #(#mouseEnter #lightBrown ) #(#mouseLeave #lightRed ) #(#mouseEnterDragging #lightGray ) #(#mouseLeaveDragging #darkGray ) #(#keyStroke #lightGreen ) )
		do: [:pair | statusSymbol == pair first
				ifTrue: [^ pair second]].
	^ #blue