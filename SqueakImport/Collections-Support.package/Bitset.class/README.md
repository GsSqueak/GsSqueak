I implement Bitsets, which are dictionary-like data structures mapping 0-1 values to integers between 0 and capacity-1, or in another way they are set-like data structures which can include values between 0 and capacity-1.
I implement three different kind of APIs, each corresponding to a way of thinking about this data structure:
- A Set-like API with #add:, #remove: and #includes:
- A Dictionary-like API with #at:, #at:put:
- And a bit-manipulation API with #bitAt:, #clearBitAt: and #setBitAt:.

Instance Variables
	bytes:		<ByteArray>
	tally:		<Integer>

bytes
	- a ByteArray which holds the values for each integer key. Each byte holds 8 values.

tally
	- the number of objects in this set, or the number or 1 values in this dictionary.
