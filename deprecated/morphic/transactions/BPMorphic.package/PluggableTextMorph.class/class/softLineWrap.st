preferences
softLineWrap
	<preference: 'Use soft line wrap' categoryList: #(#scrolling #editing) description: 'Wrap text lines to avoid horizontal scrolling.' type: #Boolean>
	^ SoftLineWrap
		ifNil: [true]