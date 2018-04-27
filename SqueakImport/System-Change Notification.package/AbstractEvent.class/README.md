An AbstractEvent is used by the system change notification framework to indicate that something happened with code - a class was recategorised, a method was added, and so on.

My environment instance variable is a Dictionary containing all the relevant information for an event - selector, class, and so on. It is not an Environment instance!