tests - arithmetic
testReciprocal

	self 
		assert: (1/2) reciprocal classAndValueEquals: 2;
		assert: (3/4) reciprocal equals: (4/3);
		assert: (-1/3) reciprocal classAndValueEquals: -3;
		assert: (-3/5) reciprocal equals: (-5/3)