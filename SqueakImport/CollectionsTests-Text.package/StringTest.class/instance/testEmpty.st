testing
testEmpty

	self
		assert: 0
		equals: String empty size
		description: 'The empty String should be empty indeed';
		
		assert: String new species
		equals: String empty species
		description: 'The empty String should be a String';
		
		assert: String empty
		identical: String empty 
		description: 'The empty String should be canonical';
		
		yourself
		
		
