removing
resetTo: index
	"Quickly remove all elements. The objects will be still referenced, but will not be 	accessible. Also make sure that the first object will be inserted at index. Choosing the 	right value has had great impact on performance, but it's neglible with the current 	implementation, so it's better to use #reset instead in most cases."
	
	firstIndex := index.
	lastIndex := firstIndex - 1