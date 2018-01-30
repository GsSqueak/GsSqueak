preferences
useSoftDropShadow
	<preference: 'Use Soft Drop Shadow' categoryList: #(#Morphic #windows #menus #performance) description: 'If drop shadows are enabled, this preference will switch between hard and soft shadows. Soft shadows are more expensive.' type: #Boolean>
	^ UseSoftDropShadow
		ifNil: [false]