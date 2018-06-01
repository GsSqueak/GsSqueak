gridded cursor
gridTo: grid origin: offset 
	"set a couple of properties to specify gridding for the temporaryCursor;
	instvars would be nicer"
	self setProperty: #gridStep toValue: grid;
		 setProperty: #gridOffset toValue: offset