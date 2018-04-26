I am a WeakIdentityDictionary, that is a dictionary pointing weakly to its associations of key->value pairs.
I am especially usefull for handling undeclared bindings that will be naturally garbage collected without having to scan all the CompiledMethods.

Instance variables:
    vacuum    <Object> a unique object used for marking empty slots

Due to usage of WeakArray for my own storage, reclaimed slots will be nilled out.
I cannot consider a nil slot as empty because of garbage collection does not fix collisions.
Thus I need to differentiate empty slots (vacuum) from garbaged collected slots (nil).

If I did not reclaim the nil slots and make them vacuum again, then my capacity would grow indefinitely.
My strategy to avoid such growth is to randomly cleanup the garbage collected slot encountered when scanning for a key.
It should mitigate the growth since this method is used when adding a new entry.

Due to those not yet cleaned-up nil slots I might over-estimate my size. Don't take it too literally.