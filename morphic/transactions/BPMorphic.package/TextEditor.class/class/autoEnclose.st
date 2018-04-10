preferences
autoEnclose
	<preference: 'Auto enclose brackets () {} []' categoryList: #('Morphic' 'editing') description: 'When true, typing an opening parenthesis, bracket or square-bracket will also add its corresponding closing character after the cursor so you can type within the bracket.' type: #Boolean>
	^ AutoEnclose
		ifNil: [false]