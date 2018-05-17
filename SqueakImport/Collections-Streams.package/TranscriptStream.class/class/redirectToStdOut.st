preferences
redirectToStdOut
	<preference: 'Redirect transcript to stdout'
		categoryList: #(printing morphic debug)
		description: 'When enabled, anything sent to the transcript will be redirected to the stdout stream and (hopefully) the OS terminal.'
		type: #Boolean>
	^ RedirectToStdOut ifNil: [false]