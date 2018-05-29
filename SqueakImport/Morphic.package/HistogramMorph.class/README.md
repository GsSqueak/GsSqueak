I display bags as a histogram, that is a bar chart of the counts in the bag.

Example:
	HistogramMorph openOn: (Smalltalk allClasses gather: 
		[:class | class selectors collect: [:selector | class ]])


Instance Variables
	bag:		<Bag>
	cachedForm:		<Form>
	countLabelBlock:		<BlockClosure>
	counts:		<SequencableCollection>
	labelBlock:		<BlockClosure>
	limit:		<Number>
	max:		<Number>
	sum:		<Number>
	values:		<SequencableCollection>

bag
	- The bag that forms the data basis for the histogram display

cachedForm
	- A form used to cache the historgram rendering.

countLabelBlock
	- Optional. Block that receives the count for the current bar and should return a String.
	  Leaving this nil is equivalent to [:count | count asString].

counts
	- Cached collection of all counts in (value-)frequency-sorted order for rendering speed.
	See values.

labelBlock
	- Optional. Block that receives the value for the current bar and should return a 
	String for the label. Leaving this nil is equivalent to [:value | value asString].

limit
	- Maximum number of elements from values to consider. Defaults to 25.

max
	- Cached maximum value from values. 

sum
	- Cached sum of all elements in values. Determines overall histogram height.

values
	- Cached collection of all values in frequency-sorted order for rendering speed.
	See counts.