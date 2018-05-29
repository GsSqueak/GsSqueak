toolbuilder
labelString

	self flag: #gsg. "stoneName and username are specific to TopazInterface"
	^ 'Session Manager [' , self repository stoneName , ', ' , self repository username , $]