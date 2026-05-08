# Formations

We want to understand the assignment of battalions to military formations over time. 
The [formations.xhtml](formations.xhtml) page captures facts about deployment of units that pertain at particular instants in time, or during specified time intervals.
The aim is then to piece these facts together to give a coherent picture, and to get a better idea where there are gaps in knowledge.
We'll try and use this information to build *timelines*. The web page includes semantic markup that supports this.

The exercise requires modelling states that change over time. Ideally, we'd have a contiguous series of states with specific dates.
Full knowledge would tell us the exact composition of formations at any time.
In practice, we might know that a state existed at some time, but not when it began or ended; or only when it began, or when it ended; or perhaps only that it was after or before some other state.
We need to capture this partial, and often vague, information we have as best we can. Some examples are below.

An [IES](https://github.com/dstl/IES4) *State* is an OWL Time *Interval*.

	1st Battalion, Hampshire Regiment, was assigned to 11th Brigade throughout the First World War.
	
This describes a state covering the whole period of the war - *time:intervalEquals*

	2nd/5th Battalion, Hampshire Regiment, was assigned to 232nd Brigade from April 1917 to the end of the First World War.

The interval begins at an instant somewhere a particular month, so I use *time:hasBeginning*, specifying an *Instant* that is *time:inXSDMonth* April 1917.
I use *time:intervalFinishes* to say this state ends at the end of the First World War, but starts after the beginning of the war.

	122nd Brigade was part of 41st Division during the First World War.
	
I use *time:intervalDuring* to say the state is valid during some part of the First World War, but not all of the First World War. Note that *time:intervalDuring* implies after the beginning and before the end of the war. If I want to fix one end of the interval at the start or end of the war I could use *time:intervalStartedBy* or *time:intervalFinishedBy* instead.

	41st Division was part of X Corps in 1917.
	41st Division was part of XVII Corps in 1917.

I use *time:inside* in cases where I know a state is valid at some particular instant. Here I have two different states of the same entity, both are which are valid at different instants *time:inXSDYear* 1917.

	The 2nd, 1/4th and 5th battalions were part of 128th Brigade in in March 1944.
	
I might model this as a separate state for each of the battalions, or one state of the brigade. In the former case, I have a state that is *ies:stateOf* a battalion and *ies:isPartof* a brigade. In the latter case, the state is *ies:stateOf* a brigade, and each battalion is *ies:isPartof* the state.

...

I can construct a history of an entity by piecing together information about its state over time. I don't expect to ever have complete information, so the history will likely be fragmentary.

What constitutes an 'entity' may be different in different circumstances. For example, the history of a larger military unit is the intersection of the histories of smaller units from which it is composed. I can consider a brigade to be a sequence of states, where the state changes as battalions come and go. This models 
...

an IES State is the state of an entity. But, if the state is a relationship between entities, then which entity?
The state is a state of a battalion, and its duration is the period during which the battalion was in the brigade. Alternatively, the state is a state of the brigade, and the duration is a period when it constituted a particular set of battalions. 

We're interested in events as they relate to battalions. The evidence about these events is likely to talk about units at the divisional or brigade level. Evidence elsewhere may describe the constitution of a division or brigade, and the two things need to be related.

The primary evidence for a history is a number of snapshots that need to be ordered in time and related by common actor. The common actor is the entity, and each piece of evidence describes a state of that entity at a particular instant. A state is a set of relations, between the target entity and others, that are true at that time. If two states close in time describe the same relations, then we may assume that the state applies for the interval between them (and secondary sources of evidence will have already done this sort of thing).

We end up with a lots of states. We can collect the set of states that are explicitly about our military unit of interest, but we should also consider any states of units for which it is a constituent part. We then need to order these in time. This gives a structure that can be checked for consistency, looking for corroboration and contradiction. We may then make inferences to simplify and summarise the structure.

---

A state is a relationship between entities at an instant in time, or over some interval of time.
IES deal with the transitory nature of relationships between entities by absorbing the relationship into the state:
There is an *ies:State* that is *ies:stateOf* the subject entity, and this state is the subject of the relationship, with the second entity as its object.
Temporal modelling then applies to the states, not the entities.


## Simplifying

This gets too complicated to capture directly as RDFa markup of XHTML. It quickly becomes easier to adopt some mark-up conventions and then post-process to
generate the rest of the structure.

* Enclose entities in HTML *span* entities.
* Add *class* attributes to HTML span to indicate entity type.
* Add *typeof* attribute to HTML span to specify entity type.
* Add *about* attribute to HTML span to specify identity.
* Add one of: *rdfs:label*, *skos:altLabel* or *skos:prefLabel* to HTML span to specify entity name.

It's useful to be able to identify a claim as well as parse it.
We might assume all text in the document is claims, or it might be useful to include comments that are not a part of claim.

Without semantic markup, we rely on NLP for facts extraction.
This can be assisted by adopting conventional phrasing of facts that make sentences easier to parse, also by providing dictionaries of 
entity names.
Dictionaries can be built from partial semantic markup.

We can consider the NLP processing in two steps: Find entities first, then find relationships between them.
The first step is made easier if we can construct dictionaries of entity names that capture any mention of an entity in the text.
THis dictionary can include alternate as well as preferred names, and can be used to identify the entity by URI.
If a mention of a name in the text is ambiguous, then it can be made explicit (without necessarily changing the test as displayed)
by adding a @content attribute to the _span_ delimiting the mention.

States can be ordered in time. States are related if they about the same entity. The change of state of an entity over time is a *timeline*.

