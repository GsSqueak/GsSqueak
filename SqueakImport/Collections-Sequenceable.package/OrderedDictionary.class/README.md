I am an ordered dictionary. I have an additional index (called 'order') to keep track of the insertion order of my associations.

The read access is not affected by the additional index.

The index is updated in O(1) [time] when inserting new keys. For present keys, that insertion involves actions in O(n) to move the respective element to the end of the order.

The growth operation compacts the index and takes O(n) additional time.

NOTE: This is still no instance of SequenceableCollection. Having this, some protocols are missing and may require working on #associations, which is an Array and thus sequenceable.