preferences
visualWrapBorderLimit
	<preference: 'Wrap border limit' categoryList: #(#editing #visuals #performance) description: 'Amount of characters after the border should be drawn.' type: #Number>
	^ VisualWrapBorderLimit
		ifNil: [80]