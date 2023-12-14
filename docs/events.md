# Events

An *event* is something that happens at a place and time. An *actor* is an entity that participates in an event in some way. Events can be linked by chains of cause and effect. Events provide explanations of who did what; where, when and why.

We can consider events at various scales, with 'larger' events composed of 'smaller' ones. For example, considering a war as a collection of battles.

Events have labels that name or describe them, and that can be used in explanation.  For example,

	The assassination of Archduke Franz Ferdinand started World War I.

Whether this explanation is correct is arguable, and the answer might be different in different circumstances. Instead, we might prefer

	The assassination of Archduke Franz Ferdinand prompted the Austrian ultimatum to Serbia.

as part of a much longer chain of cause and effect leading to World War I.

## Time

We consider the 'when' aspect of an event in one of two ways; either as an *instant* or an *interval*. An *instant* is a period of time that we don't need or want to subdivide further (and can't in the true meaning of the word). An *interval* is a duration of time that may have instants or other intervals within it, and that may overlap with other intervals. An interval has a beginning and an end, both of which are instants.

We might want to treat the same period of time as both an instant and an interval in different circumstances. For example, we might say World War I is an interval that starts in the year 1914. This is treating 1914 as an instant. On the other hand, if we wanted to describe the events of 1914, we would consider the interval between 1st January 1st and 31st December 1914. This might seem confusing at first, but the basic idea is to model events in a way that is sensible and justifiable, and that supports [reasoning about time](https://plato.stanford.edu/entries/logic-temporal/).

We will use the [OWL-Time](https://www.w3.org/TR/owl-time/) ontology to model the times of events. This gives all the flexibility we need in terms of modelling time; and it also allows us to start constructing event objects, and reasoning about them, before we have complete information. For example, we can say 'World War I' is an event that covers the interval 'start of World War I' to 'end of World War I' without knowing the dates. We can assert relationships to other events, such as World War I is 'interval before' World War II (i.e. WW1 ended before WW2 began), and reason about them. Later, we might discover and add the information that 'start of World War I' is in the year 1914 - and we can check this is consistent with the 'interval before' relationship we asserted earlier.

## Places and Actors

We are interested in where events happen, the roles that actors play in events, and we want to classify and collate event by type. We will use the [Information Exchange Standard (IES4)](https://github.com/dstl/IES4/blob/master/ies.md) for these purposes.
