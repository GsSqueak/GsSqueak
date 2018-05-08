tests
test08MultilineCode

	{ '<code>
<pre>3 + 7.
3 &gt; 4.</pre></code>' .	
	Text string: '3 + 7.
3 > 4.' runs: (RunArray runs: #(13) values: { {TextDoIt evalString: '3 + 7.
3 > 4.' } } )
	}  pairsDo: [:expectedHtml :expectedText |
		
		self convertHtml: expectedHtml.
		self assert: expectedText string equals: text string.
		self assert: expectedText runs equals: text runs.
		
		self convertText: expectedText.
		self assert: expectedHtml equals: html].