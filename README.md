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
 - The crater: formed of an inner and outer section. The inner section is a depression, which will slowly fill with water (this behaviour can be toggled in the     settings), and the outer section is composed of turned-over land (modelled by replacing the tiles with landfill).
 - The radiation: modelled as something like the poison effects, but longer lasting, and black.

Also note that the mod adds pollution output for the nukes, calculated roughly by: 

     pollution = tonnage + 1000*uranium + 100*californium + 10000*tritium

Honestly this doesn't make that much difference, as any really effective use of the nukes kills so many bases that the evolution goes straight to 1, but its still a nice to have.
### Graphics
The graphics and sounds used by this mod are all sourced from MushroomCloud, which is a wonderful mod, which I cannot love enough, however, since Mushroom Cloud does not cope with different sized explosions, all the effects of it are overridden, as such installing will make little to no difference. Using it with this mod may overwrite some changes made internally as well.
  - [MushroomCloud](https://mods.factorio.com/mod/MushroomCloud) by Arcitos

If it bothers you that the larger nuclear detonations are really pixelated, and don't mind the extra VRAM usage, then try [True-Nukes-Graphics](https://mods.factorio.com/mod/True-Nukes-Graphics), which adds a really large version of the explosion, and nothing else. It is only there to make that section of the mod optional.

The crater graphics are just different versions of the Nuclear Ground tile, with some tile-transition magic used to hold it all together. If the crater rim does not rise above the terrain for any reason, please leave it as a bug report, it should look like it is higher than its surroundings.

If the game crashes when running with mods which add lots of new tiles, the game might be running out of tiles - refer to the FAQ for more details.

### New weapons
The mod adds 11 new kinds of nuclear weapon, and changes the existing one.
These are:
 - Atomic ammunition magazine, for the machine-gun. This has a yield of maybe 0.1 tons
 - High Yield atomic ammunition magazine, for the machine-gun. This has a yield of maybe 0.5 tons
 - An atomic cannon shell, for the tank. This has a yield of ~2 tons
 - High Yield atomic cannon shell, for the tank. This has a yield of ~4 tons
 - 3 low yield atomic rockets with yields of 2, 4 and 8 tons.
 - A Low yield atomic artillery shell. This has a yield of ~20 tons
 - The base atomic bomb. This has a yield of ~20 tons, equivalent to the 'Davy Crockett'
 - A small atomic artillery shell. This has a yield of ~500 tons
 - A rocket launched version of the 500 ton yield artillery shell
 - An atomic artillery shell. This has a yield of ~1 kiloton
 - A rocket launched version of the 1 kiloton yield artillery shell
 - A Hiroshima grade artillery shell. This has a yield of ~15 kilotons, equivalent to the Hiroshima 'Little Boy' explosion
 - A 100kt artillery shell. This is equivalent to many real nuclear weapons, and is ridiculously large.
 - The nuclear weapon building. This can detonate at 15kt, 100kt, 1Mt, 5Mt, 10Mt, 50Mt, 100Mt and 1Gt.


The cannon shell has the effect of making the tank a viable late-game option, as it can realistically defeat behemoth enemies, although the tank will almost always take some damage from the blast.

The other weapons are all wide-area, and can do massive damage to one or several bases, but draw in enemies from a huge area and start forest fires. 

### Mod Spotlight
Xterminator did a mod spotlight of True-Nukes [here](https://www.youtube.com/watch?v=wuRRwpO0T24) enjoy!

### Californium
To try and justify the ridiculously low yields of the smaller weapons, a new material has been introduced: Californium.

It is very simply refined from U-235, and doesn't change that much, other than making the weapons at least seem realistic, as such, there is an option to cut it out of the production chain (so the weapons just use U-235).

### Tritium

To allow the larger nukes (100kt and above), tritium has been added, made by refining the output of special nuclear fuel cells after they have been in a reactor. 

The mod also adds Fogbank, a strange material, entirely classified, but used at some point in the US fusion bomb program, to reduce the required size of bomb. It is only needed to make the 100kt artillery shell.

#### Schall's Tank Platoon

For the sake of adding even more new nuclear options, if Schall's tank platoon is installed, the mod adds new, separate nuclear and Thermobaric options for the auto-cannon, the 88mm cannon and the 128mm cannon, these have varying yields, and the Thermobarics work as one might expect. The nuclear weapons link into the rest of the weaponry nicely:

 - The Auto-cannon shells have the same yield as the upgraded machine-gun rounds (0.5 ton), and the upgraded version has the same yield as the base-game cannon (2 ton).
 - The 88mm cannon shells have the same yield as the upgraded base (or 75mm) cannon rounds (4 ton), and the upgraded version has an 8 ton yield.
 - The 128mm cannon shells have the same yield as the upgraded 88mm cannon rounds (8 ton), and the upgraded version has the same 20 ton yield as the base rocket.

#### The 100kt and above
These larger bombs are run using a chunk-based system to avoid loading extra map. Instead the relevent damage is applied when that chunk generates. 
This can have weird effects, making some damage seem very recent (e.g. fires still burning), but makes the detonation far quicker.
These larger nukes can still be very slow when a very established factory is hit, but even in the worst cases tested, RAM usage doesn't exceed 10GB, and in unexplored map, usage didn't increase noticeably.


Note that running the 100kt, with 'Optimise 100kt' set to false, results in huge memory usage, and is very slow - not recommended.
Beware the 1Gt, an alternative to detonating this is to delete the save. The nearest survivng tree will be 70km away.

If you don't want to wait for the timer on the nuclear weapon building (and are in creative), you can simply place the detonation item in the output slot, this will detonate it instantly.

These nukes will not work if you have the new crater system tiles disabled.
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
This is primarily because for light vehicles, the fire will tend to slowly eat away their shields and then destroy them. It is much less relevant for vehicles like the tank or Spidertron, but makes a huge difference for the jet in the aircraft mod.

### Performance
To make the nukes freeze the game for less time, a map generate is queued when the nuke is first fired/started. This can result in a burst of lag (4ups) for several seconds, but makes the nukes significantly less likely to crash the game.
To allow the game to load in the relevant map areas and apply damage, the larger weapons can freeze the game for some time when they hit (as the initial damage is applied), and cause slow down for a period afterwards while the blast-wave propagates.
 - The weapons under 20 tons are reasonably quick, unless you fire loads of them.
 - The 20 ton yield weapons cause some slow down, but less than 1s of wait, and little slowness afterwards.  
 - The 500 ton yield weapons cause ~2s of freeze, less if the area is explored, and ~10s of slowness afterwards.  
 - The 1kt yield weapons cause ~10s of freeze, less if the area is explored, and ~20s of slowness afterwards.  
 - The 15kt yield weapons cause ~15s of freeze, less if the area is explored, and ~2 minutes of slowness afterwards.  
 - The 100kt nukes and above cause some freeze (from ~15s on new map, up to ~10mins on a huge map), and some slowness afterwards. The nuke also causes chunk loading to be slower for a wide area, though not by much.

These numbers get substantially worse in high density areas, such as the inside of a factory, although the freeze time reduces in explored areas.
I had originally implemented entities sheltering one another from the blast, and had debris flying off of destroyed entities, but this made little difference to the outcome, and slowed it down, so the feature was removed.



If the mod runs very slow, or crashes from lack of memory, a few mod settings can be used to help:
 - Enable nuclear weapons causing large numbers of short lived fires: un-setting this saves a lot of memory for the small to mid sized weapons (it is regarded as off for the 15kt, 100kt and 1Mt)
 - All the Fire reduction settings can be increased, and are applied separately to the 15kt and the 1000 and 500 ton, this reduces memory usage, in exchange for not looking as good. (No fires are created for the 1Mt).
 - All the Blast reduction settings can be increased, applied to the 15kt nukes, this stops the blast wave early, making the end more pronounced, but significantly reducing time to run.
 - Use more optimised detonation system: this runs a more aggressively optimised algorithm for doing the initial blast, but doesn't record entities damaged/enemies killed, and removes some animations. It may also break other mods which use lots of scripting, however it may be faster/use less memory.

Other than this, I can only recommend reducing other settings in Factorio to free up memory, if out of memory is the issue, or not detonating larger nukes, the 500t is usually enough for most things, and can normally be fired without too many consequences. 
Closing other applications which are running at the same time helps as well (particularly web-browsers as these use lots of RAM).

### General
The artillery shells should not be used with auto-fire, but there does not seem to be an obvious way to disable it, so would advise using a normal artillery shells first to clear out nearby enemies, and then switch to the nuclear shells for remote targets. Fortunately it takes very few nuclear shells to go a very long way.

The balance of this mod is unlikely to be perfect, but with artillery, late game enemies offer little threat, and the costs of these devices are high. Also these weapons tend be double-edged swords, lighting fires in the factory, and even destroying power poles if detonated too close by.

The craters will, by default, slowly fill with water. This creates nice craters in remote areas, but can cause some trouble inside a factory. To reduce the problem this causes, the ghosts still remain, and if there are any, the mod will place ghost landfill across the pool, and set drones to dig up the crater rim. 
There is an older version of this system, which can be used if compatibility problems arise due to lack of tiles, or due to personal preference, however the older system does not allow for the 100kt and above. 

The newer version uses heights from surrounding terrain, and creates the crater appropriately, which can result in the crater being more naturally integrated into the world. Water is 'boiled away' inside the fireball, and rushes back from surrounding lakes over time. Very slowly, any areas which have no connection to water also fill up.
See [Lake Chagan](https://en.wikipedia.org/wiki/Lake_Chagan) for an example of such a flooded crater.

### Compatibility
This mod works with MushroomCloud, however the graphics from Mushroom Cloud are now included in this mod. 
  - [MushroomCloud](https://mods.factorio.com/mod/MushroomCloud) by Arcitos
  
There are special shells for the [Schall's Tank Platoon](https://mods.factorio.com/mod/SchallTankPlatoon) tanks, for both thermobaric and nuclear shells, of all calibres.
If Bob's mods are installed, then the costs of the weapons are changed somewhat, to make them more affordable and reasonable. I do not have much experience with Bob's, so these might not be very balanced, but they should be a bit more affordable than they might otherwise be. The mod will also remove the atomic artillery shell from Bob's weapons, as it is replaced by the atomic artillery shells in this mod. 

This mod will not play nicely with any other mods which change nuclear weapons. It will either overwrite them, or be over-written, and it will not attempt to change any other nuclear weapons to fit in. However, it should not break mods which do not change atomic bombs. If you have an incompatibility, please report it using the discussion tab, so that I can try to fix any issues.

The chunk loaded detonations don't play nice with mods which change things using scripts as they are loaded. This includes the Ruins mod. This is why the option to disable chunk based nukes is available for the 100kt.

### The CHALLENGE!
In a normal freeplay game, set off a 1Gigaton nuke, and have your base survive with limited damage (i.e. could reasonably repair itself - maybe some losses, but not catastrophic).

This will take 1000 reactors about 7 hours to produce the tritium, and needs to be detonated ~70km away - this is a 15 minute journey by nuclear-fuel train, or about 30 minutes by car (presuming no turning, stopping, etc.). 
You also need to get 1000 stacks (25 full train carriages) of tritium there... and escape...

Good luck!!! 

### References
The numbers for the weapons are sourced from [NUKEMAP](https://nuclearsecrecy.com/nukemap/) which is excellent for giving a real world view on nukes.
The graphics and sound effects for the weapons are sourced from MushroomCloud, which exists in a modified form in a subfolder of this mod.

