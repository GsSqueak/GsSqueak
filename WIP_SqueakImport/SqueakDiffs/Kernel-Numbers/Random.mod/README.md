I implement the 32-bit version of the Mersenne Twister PRNG, using 30-bit arithmetic, based on http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/ARTICLES/mt.pdf . The parameters of the generator are stored in class variables prefixed with MT.

Instance Variables
	states:	<Array>
	index: <Integer>

index
	- the index of the state, which should be used to generate the next random integer value

states
	- an Array holding the internal state of the generator

---

If you just want a quick random integer, use:
		10 atRandom
Every integer interval can give a random number:
		(6 to: 12) atRandom
SequenceableCollections can give randomly selected elements:
		'pick one of these letters randomly' atRandom
SequenceableCollections also respond to shuffled, as in:
		($A to: $Z) shuffled

The correct way to use class Random is to store one in an instance or class variable:
		myGenerator := Random new.
Then use it every time you need another number between 0.0 and 1.0 (excluding)
		myGenerator next
You can also generate a positive integer
		myGenerator nextInt: 10