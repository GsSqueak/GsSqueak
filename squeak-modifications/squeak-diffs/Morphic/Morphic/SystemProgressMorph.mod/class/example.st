examples
example
	"SystemProgressMorph example"
	'Progress' 
		displayProgressFrom: 0 to: 1000
		during: [:bar | 0 to: 1000 do: [:i | bar value: i. (Delay forMilliseconds: 2) wait]]
