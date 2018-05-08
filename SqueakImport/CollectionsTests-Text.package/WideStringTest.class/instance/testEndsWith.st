tests - endsWith
testEndsWith
	"Mix of tests from http://bugs.squeak.org/view.php?id=6366
	#endsWith: was broken because using broken findSubstring
	and tests from johnmci at http://bugs.squeak.org/view.php?id=5331"

	| ws |	
	
	self assert: ('abc' endsWith: 'bc').
	self assert: ('abc' endsWith: 'bc' asWideString).
	self assert: ('abc' asWideString endsWith: 'bc').
	self assert: ('abc' endsWith: 'bX') not.
	self assert: ('abc' endsWith: 'BC') not.
	self assert: ('abc' endsWith: 'BC' asWideString) not.
	self assert: ('ABC' asWideString endsWith: 'bc') not.
	
	self assert: ('Elvis' endsWith: 'vis').
	self assert: ('Elvis' asWideString endsWith: 'vis').
	self assert: ((WideString with: (Unicode value: 530)) , 'Elvis' endsWith: 'vis').
	
	self deny: ('Elvis' endsWith: 'Vis').
	self deny: ('Elvis' asWideString endsWith: 'vIs').
	self deny: ((WideString with: (Unicode value: 530)) , 'Elvis' endsWith: 'viS').
	
	ws := 'vis' , (WideString with: (Unicode value: 530)).
	self deny: ('Elvis' endsWith: ws).
	self assert: ('Elvis' , ws endsWith: ws).
	self deny: ((WideString with: (Unicode value: 530)) , 'Elvis' endsWith: ws).

