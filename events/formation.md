

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
	
I can