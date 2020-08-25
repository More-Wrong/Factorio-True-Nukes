# Factorio-True-Nukes
A Factorio mod adding realistic nuclear blasts, and more nuclear options.

The Factorio in-built atomic weapons are tiny, and don't really model the destructive side-effects of the blast. Sure, the explosions blast out in a ring, but then they just stop. What about the fire, the blast wave crashing across the world. It just won't do!

And thus I present to you, True-Nukes!!!

## Effects
This mod aims to simulate most of the real effects of a nuclear weapon, in a Factorio world. It models the blast wave and the thermal radiation release, as well as the fireball and crater, and does this at realistic scales for the yields of the nuclear weapons. This both makes nuclear weapons more useful, and demonstrates quite how destructive even small nuclear weapons can be.  

The effects modelled are:
  - The thermal radiation: instantaneous energy release, which burns anything its path, causing instant damage in a wide area.
  - The blast wave: a pressure wave, blowing over structures and trees, which ripples out causing damage as it goes.
  - The fireball: vaporizes everything within a certain radius.
  - The crater: formed of an inner and outer section. The inner section is a depression, which will slowly fill with water (this behaviour can be toggled in the settings), and the outer section is composed of turned-over land.
  - The radiation: modelled as something like the poison effects, but longer lasting, and black.

### New weapons
The mod adds three new kinds of nuclear weapon, and changes the existing one.
These are:
  - An atomic cannon shell, for the tank. This has a yield of ~2 tons
  - The base atomic bomb. This has a yield of ~20 tons, equivalent to the 'Davy Crockett'
  - A small atomic artillery shell. This has a yield of ~500 tons
  - An atomic artillery shell. This has a yield of ~1 kiloton
  - A Hiroshima grade artillery shell. This has a yield of ~15 kilotons, equivilent to the Hiroshima 'Little Boy' explosion
  
The cannon shell has the effect of making the tank a viable late-game option, as it can realistically defeat behemoth enemies, although the tank will almost always take some damage from the blast.

The other weapons are all wide-area, and can do massive damage to one or several bases, but draw in enemies from a huge area and start forest fires. 

### Thermobaric weapons
The mod also adds Thermobaric weapons. These are weapons using lots of fuel which ignites with the air. The most well known example is the fuel air bomb, but other types exist.
These are not nukes (by any streatch of the imagination), but they rely on similar systems (the blast wave etc.) and are, with some imagination, like early game nukes.

There are three types implemented, and, due to the lack of information on thermobaric weapons, they are basically small, medium and large.
  - Small:  Thermobaric cannon shell, for the tank. This has a 40m outer blast radius.
  - Medium: Thermobaric rocket, for the rocket launcher. This has an 80m outer blast radius.blast radius.
  - Large:  Thermobaric artillery shell. This has a 120m outer blast radius.

These weapons have their own research, and can be obtained using chemical and military science packs, however they are relatively expensive.
They also do poorly against strong enemies, as while they have a large blast radius, they do not do much damage.

Compared to the nuclear weapons, these have much shorter ranges, but they do involve a lot of fire, which is very performance intensive. 
They are not too bad, but firing the cannon shell at full fire rate can reduce the framerate significantly. 
Due to the lack of extra map loading, they have no noticable freeze time when they hit.

### Performance
To allow the game to load in the relevent map areas and apply damage, the larger weapons can freeze the game for some time when they hit (as the initial damage is applied), and cause slow down for a period afterwards while the blast-wave propagates.
The atomic cannon shell is quick enough that it can be fired at full rate, even with fire rate upgrades.  
The atomic bomb causes some slow down, but less than 1s of wait, and little slowness afterwards.  
The small atomic artillery shell causes ~2s of freeze, less if the area is explored, and ~10s of slowness afterwards.  
The atomic artillery shell causes ~10s of freeze, less if the area is explored, and ~40s of slowness afterwards.  
The big atomic artillery shell causes ~15s of freeze, less if the area is explored, and ~120s of slowness afterwards.  

These numbers get substantially worse in high density areas, such as the inside of a factory.
I had originally intended to go all the way up into 100kt range, but the game simply could not cope; I had also originally implemented entities sheltering one another from the blast, and had debris flying off of destroyed entities, but this made little difference to the outcome, and slowed it down.

### General
The artillery shells should not be used with autofire, but there does not seem to be an obvious way to disable it, so would advise using a normal (or thermobaric) artillery shells first to clear out nearby enemies, and then switch to the nuclear shells for remote targets. Fortunately it takes very few nuclear shells to go a very long way.

The balance of this mod is unlikely to be perfect, but with artillery, late game enemies offer little threat, and the costs of these devices are high. Also these weapons tend be double-edged swords, lighting fires in the factory, and even destryoing power poles if detonated too close by.

The craters will, by default, slowly fill with water after 5 minutes. This creates nice craters in remote areas, but can cause some trouble inside a factory, as it destroys buildings in its way. To reduce the problem this causes, the ghosts still remain, and if there are any, the crater will place ghost landfill across the pool. Until the crater is complete however, it will destroy any landfill placed in it. This is why the option to disable the water exists - but the driving principle is that you really shouldn't be trying to build over a nuclear crater too soon after the explosion.
See [Lake Chagan](https://en.wikipedia.org/wiki/Lake_Chagan) for an example of such a flooded crater.

### Compatibility
This mod works very well with MushroomCloud, as this one only really focuses on the functional side of nuclear weapons, where MushroomCloud focuses on the graphical. It also has some code to make the graphics from MushroomCloud scale up for the larger weapons.
  - [MushroomCloud](https://mods.factorio.com/mod/MushroomCloud) by Arcitos

This mod will not play nicely with any other mods which change nuclear weapons. It will either overwrite them, or be overwriten, and it will not attempt to change any other nuclear weapons to fit in. However, it should not break mods which do not change atomic bombs.

### The CHALLENGE!
1. Install this mod, plus Mushroom Cloud (see above) for a great explosion.
2. Load up your favourite mega-factory, or closest equivalent (please take a copy of the save first).
3. Set off an 'Atomic artillery shell' (the 1 kiloton device) in the middle of your base.
4. Try to recover!

Experimenting with this, I found that the recovery is hampered by the *sheer loss of infrastructure*! Most power is down, and most active drones are destroyed. The drones that are left have no power or resources, and there aren't enough railways to bring resources in. The effects of a real weapon are similar, not only causing immediate damage, but also loss of infrastructure, allowing little help in. The recovery operation feels very post-nuclear, scavenging for surviving resources or drones, and trying to defend the borders against the biter attacks with whatever fragmentary defences are still working.

Note that the 1 kiloton device is so low-yield that few such devices were developed for practical warfare. The closest in the US arsenal was the [W25](https://en.wikipedia.org/wiki/W25_(nuclear_warhead)) at 1.5 kilotons, which was deployed as an air defence weapon! You are destroying your base with an air-to-air missile... 

### References
The numbers for the weapons are sourced from [NUKEMAP](https://nuclearsecrecy.com/nukemap/) which is excellent for giving a real world view on nukes.
