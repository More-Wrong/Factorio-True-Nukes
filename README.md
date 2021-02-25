# Factorio-True-Nukes
A Factorio mod adding realistic nuclear blasts, and more nuclear options, as well as Thermobaric weapons.

The Factorio in-built atomic weapons are tiny, and don't really model the destructive side-effects of the blast. Sure, the explosions blast out in a ring, but then they just stop. What about the fire, the blast wave crashing across the world. It just won't do!

And thus I present to you, True-Nukes!!!

## Effects
This mod aims to simulate most of the real effects of a nuclear weapon, in a Factorio world. It models the blast wave and the thermal radiation release, as well as the fireball and crater, and does this at realistic scales for the yields of the nuclear weapons. This both makes nuclear weapons more useful, and demonstrates quite how destructive even small nuclear weapons can be.  

The effects modelled are:
 - The thermal radiation: instantaneous energy release, which burns anything its path, causing instant damage in a wide area.
 - The blast wave: a pressure wave, blowing over structures and trees, which ripples out causing damage as it goes.
 - The fireball: vaporizes everything within a certain radius.
 - The crater: formed of an inner and outer section. The inner section is a depression, which will slowly fill with water (this behaviour can be toggled in the settings), and the outer section is composed of turned-over land (modelled by replacing the tiles with landfill). The mod also adds a bit of noise to the outisde of the crater to make it sem more natural, this can be toggled in settings.
 - The radiation: modelled as something like the poison effects, but longer lasting, and black.

### Graphics
The graphics and sounds used by this mod are all sourced from MushroomCloud, which is a wonderful mod, which I cannot love enough, however, since Mushroom Cloud does not cope with different sized explosions, all the effects of it are overridden, as such installing will make little to no difference. Using it with this mod may overwrite some changes made internally as well.
  - [MushroomCloud](https://mods.factorio.com/mod/MushroomCloud) by Arcitos

If it bothers you that the larger nuclear detonations are really pixelated, and don't mind the extra VRAM usage, then try [True-Nukes-Graphics](https://mods.factorio.com/mod/True-Nukes-Graphics), which adds a really large version of the explosion, and nothing else. It is only there to make that section of the mod optional.

### New weapons
The mod adds three new kinds of nuclear weapon, and changes the existing one.
These are:
 - Atomic ammunition magazine, for the machine-gun. This has a yield of maybe 0.1 tons
 - High Yield atomic ammunition magazine, for the machine-gun. This has a yield of maybe 0.5 tons
 - An atomic cannon shell, for the tank. This has a yield of ~2 tons
 - High Yield atomic cannon shell, for the tank. This has a yield of ~4 tons
 - The base atomic bomb. This has a yield of ~20 tons, equivalent to the 'Davy Crockett'
 - A small atomic artillery shell. This has a yield of ~500 tons
 - A rocket launched version of the 500 ton yield artillery shell
 - An atomic artillery shell. This has a yield of ~1 kiloton
 - A rocket launched version of the 1 kiloton yield artillery shell
 - A Hiroshima grade artillery shell. This has a yield of ~15 kilotons, equivalent to the Hiroshima 'Little Boy' explosion
 - A 100kt artillery shell. This is equivalent to many real nuclear weapons, and is ridiculously large.
 - The nuclear weapon building. This can detonate at 15kt, 100kt or 1Mt. 1Mt requires at least 20GB of RAM to avoid crashing.

The cannon shell has the effect of making the tank a viable late-game option, as it can realistically defeat behemoth enemies, although the tank will almost always take some damage from the blast.

The other weapons are all wide-area, and can do massive damage to one or several bases, but draw in enemies from a huge area and start forest fires. 

### Californium
To try and justify the ridiculously low yields of the smaller weapons, a new material has been introduced: Californium.

It is very simply refined from U-235, and doesn't change that much, other than making the weapons at least seem realistic, as such, there is an option to cut it out of the production chain (so the weapons just use U-235).

### Tritium

To allow the larger nukes (100kt and 1Mt) tritium can be made, by refining the output of special nuclear fuel cells after they have been in a reactor. 

The mod also adds Fogbank, a stange material, entirely classified, but used in the early US fusion bomb program, to reduce the required size of bomb. It is only needed to make the 100kt artillery shell.

#### Schall's Tank Platoon

For the sake of adding even more new nuclear options, if Schall's tank platoon is installed, the mod adds new, separate nuclear and thermobaric options for the auto-cannon, the 88mm cannon and the 128mm cannon, these have varying yields, and the Thermobarics work as one might expect. The nuclear weapons link into the rest of the weaponry nicely:

 - The Auto-cannon shells have the same yield as the upgraded machine-gun rounds (0.5 ton), and the upgraded version has the same yield as the base-game cannon (2 ton).
 - The 88mm cannon shells have the same yield as the upgraded base (or 75mm) cannon rounds (4 ton), and the upgraded version has an 8 ton yield.
 - The 128mm cannon shells have the same yield as the upgraded 88mm cannon rounds (8 ton), and the upgraded version has the same 20 ton yield as the base rocket.

#### The 100kt and 1Mt
The 100kt nuclear weapon is only just usable. There is a significant change that it will run your game out of memory and crash it, 
so it is recommended to ensure that nothing else is running (this particularly applies to web browsers, as they use loads of memory), 
and that it is only detonated on machines with 16GB of memory or more. It was recorded using almost 10GB of memory during a detonation in a late game factory. Be very careful.

However bad the 100kt is, the 1Mt is worse. It only sometimes works, and the game can crash for no reason. It can use up to 16GB of memory, and so should only be detonated on machines with 20GB of memory or more. I honestly cannot think of a use for such a weapon, other that to show quite how big a real nuke is.

### Thermobaric weapons
The mod also adds Thermobaric weapons. These are weapons using lots of fuel which ignites with the air. The most well known example is the fuel air bomb, but other types exist. These are not nukes (by any stretch of the imagination), but they rely on similar systems (the blast wave, etc) and are, with some imagination, like early-game nukes.

There are three types implemented, small, medium and large.
 - Small:  Thermobaric cannon shell, for the tank. This has a 40m outer blast radius.
 - Medium: Thermobaric rocket, for the rocket launcher. This has an 80m outer blast radius.
 - Large:  Thermobaric artillery shell. This has a 120m outer blast radius.

These weapons have their own research, and can be obtained using chemical and military science packs, however they are relatively expensive. They also do poorly against behemoth biters/spitters, as while they have a large blast radius; they do not do much damage, this leaves a good role for nukes in the late game.

Compared to the nuclear weapons, these have much smaller blast areas, but they do involve a lot of fire, which is very performance intensive; this is not too bad, but firing the cannon shell at full fire-rate can reduce the frame-rate significantly. Due to the lack of extra map loading, they have no noticeable freeze time when they hit.

These weapons are more likely to disrupt game balance, as they are much more early-game than the nukes, hence the option to disable them.

### The fire shield
This is a bit of a weird item, it is simply an equipment module which prevents the nuclear weapons and Thermobarics from setting fire to the user. It uses a lot of power to do so however, and doesn't provide much shielding. 
This is primarily because for light vehicles, the fire will tend to slowly eat away their shields and then destroy them. It is much less relevant for vehicles like the tank or spider-tron, but makes a huge difference for the jet in the aircraft mod.

### Performance
To make the nukes freeze the game for less time, a map generate is queued when the nuke is first fired/started. This can result in a burst of lag (4ups) for several seconds, but makes the nukes significantly less likely to crash the game.
To allow the game to load in the relevant map areas and apply damage, the larger weapons can freeze the game for some time when they hit (as the initial damage is applied), and cause slow down for a period afterwards while the blast-wave propagates.
 - The atomic cannon shell is quick enough that it can be fired at full rate, even with fire rate upgrades.  
 - The atomic bomb causes some slow down, but less than 1s of wait, and little slowness afterwards.  
 - The small atomic artillery shell causes ~2s of freeze, less if the area is explored, and ~10s of slowness afterwards.  
 - The atomic artillery shell causes ~10s of freeze, less if the area is explored, and ~20s of slowness afterwards.  
 - The hiroshima atomic artillery shell causes ~15s of freeze, less if the area is explored, and ~2 minutes of slowness afterwards.  
 - The 100kt nukes cause a minute or two of freeze, less if the area is explored, and ~15 minutes of slowness afterwards.  
 - The 1Mt nuke causes 2-5 minutes of freeze, less if the area is explored, and ~1 hour of slowness afterwards.  

These numbers get substantially worse in high density areas, such as the inside of a factory, although the freeze time reduces in explored areas.
I had originally implemented entities sheltering one another from the blast, and had debris flying off of destroyed entities, but this made little difference to the outcome, and slowed it down, so the feature was removed.


If the mod runs very slow, or crashes from lack of memory, a few mod settings can be used to help:
 - Enable nuclear weapons causing large numbers of short lived fires: unsetting this saves a lot of memory for the small to mid sized weapons (it is regarded as off for the 15kt and 100kt)
 - All the Fire reduction settings can be increased, and are applied separately to the 100kt, the 15kt and the 1000 and 500 ton, this reduces memory usage, in exchange for not looking as good. (No fires are created for the 1Mt).
 - All the Blast reduction settings can be increased, and are applied separately to the 1Mt, 100kt and 15kt nukes, this stops the blast wave early, making the end more pronounced, but significantly reducing time to run.

Other than this, I can only recommend reducing other settings in Factorio to free up memory, if out of memory is the issue, or not detonating larger nukes, the 500t is usually enough for most things, and can normally be fired without too many consequences.

### General
The artillery shells should not be used with auto-fire, but there does not seem to be an obvious way to disable it, so would advise using a normal artillery shells first to clear out nearby enemies, and then switch to the nuclear shells for remote targets. Fortunately it takes very few nuclear shells to go a very long way.

The balance of this mod is unlikely to be perfect, but with artillery, late game enemies offer little threat, and the costs of these devices are high. Also these weapons tend be double-edged swords, lighting fires in the factory, and even destroying power poles if detonated too close by.

The craters will, by default, slowly fill with water after 5 minutes. This creates nice craters in remote areas, but can cause some trouble inside a factory, as it destroys buildings in its way. To reduce the problem this causes, the ghosts still remain, and if there are any, the crater will place ghost landfill across the pool. Until the crater is complete however, it will destroy any landfill placed in it. This is why the option to disable the water exists - but the driving principle is that you really shouldn't be trying to build over a nuclear crater too soon after the explosion.
See [Lake Chagan](https://en.wikipedia.org/wiki/Lake_Chagan) for an example of such a flooded crater.

### Compatibility
This mod works with MushroomCloud, however the graphics from Mushroom Cloud are now included in this mod. 
  - [MushroomCloud](https://mods.factorio.com/mod/MushroomCloud) by Arcitos
There are special shells for the [Schall's Tank Platoon](https://mods.factorio.com/mod/SchallTankPlatoon) tanks, for both thermobaric and nuclear shells, of all calibres.
If Bob's mods are installed, then the costs of the weapons are changed somewhat, to make them more affordable and reasonable. I do not have much experience with Bob's, so these might not be very balanced, but they should be a bit more affordable than they might otherwise be. The mod will also remove the atomic artillery shell from Bob's weapons, as it is replaced by the atomic artillery shells in this mod.

This mod will not play nicely with any other mods which change nuclear weapons. It will either overwrite them, or be over-written, and it will not attempt to change any other nuclear weapons to fit in. However, it should not break mods which do not change atomic bombs.

### The CHALLENGE!
1. Install this mod.
2. Load up your favourite mega-factory, or closest equivalent (please take a copy of the save first).
3. Set off an 'Atomic artillery shell' (the 1 kiloton device) in the middle of your base.
4. Try to recover!

Experimenting with this, I found that the recovery is hampered by the *sheer loss of infrastructure*! Most power is down, and most active drones are destroyed. The drones that are left have no power or resources, and there aren't enough railways to bring resources in. The effects of a real weapon are similar, not only causing immediate damage, but also loss of infrastructure, allowing little help in. The recovery operation feels very post-nuclear, scavenging for surviving resources or drones, and trying to defend the borders against the biter attacks with whatever fragmentary defences are still working.

Note that the 1 kiloton device is so low-yield that few such devices were developed for practical warfare. The closest in the US arsenal was the [W25](https://en.wikipedia.org/wiki/W25_(nuclear_warhead)) at 1.5 kilotons, which was deployed as an air defence weapon! You are destroying your base with an air-to-air missile... 

### References
The numbers for the weapons are sourced from [NUKEMAP](https://nuclearsecrecy.com/nukemap/) which is excellent for giving a real world view on nukes.
The graphics and sound effects for the weapons are sourced from MushroomCloud, which exists in a modified form in a subfolder of this mod.

