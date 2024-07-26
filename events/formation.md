

An IES *State* is an OWL Time *Interval*.

	1st Battalion, Hampshire Regiment, was assigned to 11th Brigade throughout the First World War.
	
This describes a state covering the whole period of the war - *time:intervalEquals*

	2nd/5th Battalion, Hampshire Regiment, was assigned to 232nd Brigade from April 1917 to the end of the First World War.

The interval begins at an instant somewhere a particular month, so I use *time:hasBeginning*, specifying an *Instant* that is *time:inXSDMonth* April 1917.
I use *time:intervalFinishes* to say this state ends at the end of the First World War, but starts after the beginning of the war.

	122nd Brigade was part of 41st Division during the First World War.
	
I use *time:intervalDuring* to say the state is valid during some part of the First World War, but not all of the First World War. Note that *time:intervalDuring* implies after the beginning and before the end of the war. If I want to fix one end of the interval at the start or end of the war I could use *time:intervalStarts* or *time:intervalMeets* instead.

	41st Division was part of X Corps in 1917.
	41st Division was part of XVII Corps in 1917.

I can use *time:inside* in cases where I know a state is valid at some particular instant. Here I have two different states of the same entity, both are which are valid at different instants *time:inXSDYear* 1917.

	75th Division was raised in the field by the Egyptian Expeditionary Force in 1917 and existed until 1920.
	
...

We can construct a history of an entity by piecing together information about its state over time. I don't expect to ever have complete information, so the history will be fragmentary.

What constitutes an 'entity' may be different in different circumstances. For example, the history of a larger military unit is composed from the intersections of the histories of smaller units from which it is composed.

We're interested in events as they relate to battalions. The evidence about these events is likely to talk about units at the divisional or brigade level. Evidence elsewhere may describe the constitution of a division or brigade, and the two things need to be related.

The primary evidence for a history is a number of snapshots that need to be ordered in time and related by common actor. The common actor is the entity, and each piece of evidence describes a state of that entity at a particular instant. A state is a set of relations, between the target entity and others, that are true at that time. If two states close in time describe the same relations, then we may assume that the state applies for the interval between them (and secondary sources of evidence will have already done this sort of thing).

We end up with a lots of states. We can collect the set of states that are explicitly about our military unit of interest, but we should also consider any states of units for which it is a constituent part. We then need to order these in time. This gives a structure that can be checked for consistency, looking for corroboration and contradiction. We may then make inferences to simplify and summarise the structure.

