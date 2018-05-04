transformations
mapReceiversIn: aDictionary
	expression mapReceiversIn: aDictionary.
	cases do: [ :c | c mapReceiversIn: aDictionary ]
