I provide a serialization mechanism when communicating between Squeak and GemStone. Different to STON I can be used without any modifications to GemStone. This is done by wrapping the original executable query with the serialization code.

## Structure of the Serialized Form

- Strings, Symbols, Numbers, Booleans and nil are serialized as their respective string representation (e.g. 'aString' , #'aSymbol' , 16rFF , true , nil ).
- Arrays are encompassed by square brackets, with the elements being separated by a single comma (e.g. ['aString',12,[false]] ).
- All other objects are represented as "composites" - arrays with their class attached in round brackets (e.g. [[#key1,'value1'](Association),[#key2,'value2'](Association)](Dictionary) ).

## Serializing Queries

To allow the serialization step to occur on GemStone's side, a description of the expected query result has to be known beforehand.

## Defining Composites

3 class methods are required on the class which represents the object created by the query on GemStone's side.
1. The `CompositeTransformation` method has to return a block that transforms an object into an array. The block's source will be sent to GemStone to be evaluated there. It will be fed all objects that are described as the respective composite's name. The block can also have a second parameter that is given a spec which more closely describes the object to be serialized. Specs are empty arrays by default, unless specified otherwise by the programmer.
2. The `compositeStructureForSpec:` method is passed all specs with which a composite is supposed be serialized. The return value should be a description of the array that would result from the `CompositeTransformation` using the given spec.
3. The `deserializeFrom:` method is passed the already deserialized array created by `CompositeTransformation`. The resulting object can then be used in Squeak