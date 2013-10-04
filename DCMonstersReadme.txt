DCMonsters100
=============

Basically just variations of the existing monsters, rather than anything exciting.

We have Metal versions of the EliteKrall, Behemoth, Manta, GiantGasbag, MercenaryElite, Slith, Titan and Warlord.
Note that the Metal Giant Gasbag does not spawn children (well - it is made of metal!)
Most have one extra score point above the original, with about 20 extra health. The Titan is a lot more health.

Also there are four Ghost monsters. These fly and in theory do not take knockback. 
They are the Behemoth, Slith, Skaarj and Titan. The Titan has less health than normal (it's a light weight!)

There are eight extra monsters.
LaserKrall and LaserBehemoth. Invisible except when firing. Different projectile types.
BlastKrall - just a green krall really firing green ammo.
BioSkaarj - skaarj firing bio shots. Bright red.
ShellGasBag - a blue gasbag firing flak shells
BeamWarlord - fires krall-style shots rather than rockets. 
PoisonPupae - a bright green pupae that poisons you when it bites
IceKrall - a blue/white krall, that freezes you for a second.

Just put the DCMonsters100.u in the UT2004 system folder, the DCMonsters100.utx in the Textures folder,
and add the DCMonsters100 to the server packages.
Then add the entries to the satoremonsterpackv120.ini file, or whatever monster manager is used.

So, in your satoremonsterpackv120.ini, you need a section like

[satoreMonsterPackv120.SMPMonsterTable]
MonsterTable=(MonsterName="None",MonsterClassName=)
MonsterTable=(MonsterName="Pupae",MonsterClassName="SkaarjPack.SkaarjPupae")
MonsterTable=(MonsterName="Razor Fly",MonsterClassName="SkaarjPack.Razorfly")
MonsterTable=(MonsterName="Manta",MonsterClassName="SkaarjPack.Manta")
MonsterTable=(MonsterName="Krall",MonsterClassName="SkaarjPack.Krall")
MonsterTable=(MonsterName="Elite Krall",MonsterClassName="SkaarjPack.EliteKrall")
MonsterTable=(MonsterName="Gasbag",MonsterClassName="SkaarjPack.Gasbag")
MonsterTable=(MonsterName="Brute",MonsterClassName="SkaarjPack.Brute")
MonsterTable=(MonsterName="Skaarj",MonsterClassName="SkaarjPack.Skaarj")
MonsterTable=(MonsterName="Behemoth",MonsterClassName="SkaarjPack.Behemoth")
MonsterTable=(MonsterName="Ice Skaarj",MonsterClassName="SkaarjPack.IceSkaarj")
MonsterTable=(MonsterName="Fire Skaarj",MonsterClassName="SkaarjPack.FireSkaarj")
MonsterTable=(MonsterName="WarLord",MonsterClassName="SkaarjPack.WarLord")
MonsterTable=(MonsterName="Queen",MonsterClassName="satoreMonsterPackv120.SMPQueen")
MonsterTable=(MonsterName="Titan",MonsterClassName="satoreMonsterPackv120.SMPTitan")
MonsterTable=(MonsterName="Stone Titan",MonsterClassName="satoreMonsterPackv120.SMPStoneTitan")
MonsterTable=(MonsterName="Mercenary",MonsterClassName="satoreMonsterPackv120.SMPMercenary")
MonsterTable=(MonsterName="Elite Mercenary",MonsterClassName="satoreMonsterPackv120.SMPMercenaryElite")
MonsterTable=(MonsterName="Slith",MonsterClassName="satoreMonsterPackv120.SMPSlith")
MonsterTable=(MonsterName="Skaarj Trooper",MonsterClassName="satoreMonsterPackv120.SMPSkaarjTrooper")
MonsterTable=(MonsterName="Skaarj Sniper",MonsterClassName="satoreMonsterPackv120.SMPSkaarjSniper")
MonsterTable=(MonsterName="Giant Gasbag",MonsterClassName="satoreMonsterPackv120.SMPGiantGasbag")
MonsterTable=(MonsterName="DevilFish",MonsterClassName="satoreMonsterPackv120.SMPDevilFish")
MonsterTable=(MonsterName="MetalSkaarj",MonsterClassName="satoreMonsterPackv120.SMPMetalSkaarj")
MonsterTable=(MonsterName="NaliFighter",MonsterClassName="satoreMonsterPackv120.SMPNaliFighter")
MonsterTable=(MonsterName="Nali",MonsterClassName="satoreMonsterPackv120.SMPNali")
MonsterTable=(MonsterName="Nali Cow",MonsterClassName="satoreMonsterPackv120.SMPNaliCow")
MonsterTable=(MonsterName="Nali Rabbit",MonsterClassName="satoreMonsterPackv120.SMPNaliRabbit")
MonsterTable=(MonsterName="Metal Krall",MonsterClassName="DCMonsters100.MetalEliteKrall")
MonsterTable=(MonsterName="Metal Behemoth",MonsterClassName="DCMonsters100.MetalBehemoth")
MonsterTable=(MonsterName="Metal Gasbag",MonsterClassName="DCMonsters100.MetalGiantGasbag")
MonsterTable=(MonsterName="Metal Manta",MonsterClassName="DCMonsters100.MetalManta")
MonsterTable=(MonsterName="Metal Mercenary",MonsterClassName="DCMonsters100.MetalMercenaryElite")
MonsterTable=(MonsterName="Metal Slith",MonsterClassName="DCMonsters100.MetalSlith")
MonsterTable=(MonsterName="Metal Titan",MonsterClassName="DCMonsters100.MetalTitan")
MonsterTable=(MonsterName="Metal Warlord",MonsterClassName="DCMonsters100.MetalWarlord")
MonsterTable=(MonsterName="Ghost Skaarj",MonsterClassName="DCMonsters100.GhostSkaarj")
MonsterTable=(MonsterName="Ghost Behemoth",MonsterClassName="DCMonsters100.GhostBehemoth")
MonsterTable=(MonsterName="Ghost Slith",MonsterClassName="DCMonsters100.GhostSlith")
MonsterTable=(MonsterName="Ghost Titan",MonsterClassName="DCMonsters100.GhostTitan")
MonsterTable=(MonsterName="Blast Krall",MonsterClassName="DCMonsters100.BlastKrall")
MonsterTable=(MonsterName="Laser Krall",MonsterClassName="DCMonsters100.LaserKrall")
MonsterTable=(MonsterName="Laser Behemoth",MonsterClassName="DCMonsters100.LaserBehemoth")
MonsterTable=(MonsterName="BioSkaarj",MonsterClassName="DCMonsters100.BioSkaarj")
MonsterTable=(MonsterName="ShellGasBag",MonsterClassName="DCMonsters100.ShellGasBag")
MonsterTable=(MonsterName="BeamWarlord",MonsterClassName="DCMonsters100.BeamWarlord")
MonsterTable=(MonsterName="PoisonPupae",MonsterClassName="DCMonsters100.PoisonPupae")
MonsterTable=(MonsterName="Ice Krall",MonsterClassName="DCMonsters100.IceKrall")

with the DCMonsters added at the end.

You then need to add the relevant monster numbers to the SMPWaves lines in the 
[satoreMonsterPackv120.mutsatoreMonsterPack] section

For example, number 34 would be the Metal Titan monster, which would be good to add to the last titan wave. So, edit that line and set MonsterNum[2]=34
SMPWaves=(WaveDuration=120,WaveDifficulty=8.000000,WaveMaxMonsters=32,MonsterNum[0]=14,MonsterNum[1]=15,MonsterNum[2]=34,MonsterNum[3]=0,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=14)

So, a sample one would be
[satoreMonsterPackv120.mutsatoreMonsterPack]
MonsterNum[0]=1
MonsterNum[1]=2
MonsterNum[2]=3
MonsterNum[3]=4
MonsterNum[4]=5
MonsterNum[5]=6
MonsterNum[6]=7
MonsterNum[7]=8
MonsterNum[8]=9
MonsterNum[9]=10
MonsterNum[10]=11
MonsterNum[11]=12
MonsterNum[12]=13
MonsterNum[13]=14
MonsterNum[14]=15
MonsterNum[15]=20
FallBackMonsterNum=4
bUseSMPWaveTable=True
bUseWebServerConfigPage=false
SMPWaves=(WaveDuration=90,WaveDifficulty=2.500000,WaveMaxMonsters=24,MonsterNum[0]=1,MonsterNum[1]=2,MonsterNum[2]=3,MonsterNum[3]=4,MonsterNum[4]=6,MonsterNum[5]=22,MonsterNum[6]=24,MonsterNum[7]=25,MonsterNum[8]=27,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=4)
SMPWaves=(WaveDuration=90,WaveDifficulty=2.900000,WaveMaxMonsters=24,MonsterNum[0]=3,MonsterNum[1]=4,MonsterNum[2]=5,MonsterNum[3]=6,MonsterNum[4]=24,MonsterNum[5]=26,MonsterNum[6]=40,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=6)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=5,MonsterNum[1]=6,MonsterNum[2]=24,MonsterNum[3]=41,MonsterNum[4]=46,MonsterNum[5]=47,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=41)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=5,MonsterNum[1]=7,MonsterNum[2]=24,MonsterNum[3]=41,MonsterNum[4]=47,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=5)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=7,MonsterNum[1]=24,MonsterNum[2]=42,MonsterNum[3]=0,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=7)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=16,MonsterNum[0]=14,MonsterNum[1]=15,MonsterNum[2]=39,MonsterNum[3]=0,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=14)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=8,MonsterNum[1]=9,MonsterNum[2]=18,MonsterNum[3]=42,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=8)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=8,MonsterNum[1]=9,MonsterNum[2]=18,MonsterNum[3]=20,MonsterNum[4]=29,MonsterNum[5]=36,MonsterNum[6]=42,MonsterNum[7]=46,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=8)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=8,MonsterNum[1]=9,MonsterNum[2]=10,MonsterNum[3]=16,MonsterNum[4]=18,MonsterNum[5]=19,MonsterNum[6]=24,MonsterNum[7]=29,MonsterNum[8]=43,MonsterNum[9]=44,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=10)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=10,MonsterNum[1]=11,MonsterNum[2]=16,MonsterNum[3]=18,MonsterNum[4]=19,MonsterNum[5]=20,MonsterNum[6]=23,MonsterNum[7]=43,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=10)
SMPWaves=(WaveDuration=90,WaveDifficulty=3.000000,WaveMaxMonsters=24,MonsterNum[0]=10,MonsterNum[1]=11,MonsterNum[2]=12,MonsterNum[3]=16,MonsterNum[4]=17,MonsterNum[5]=18,MonsterNum[6]=19,MonsterNum[7]=23,MonsterNum[8]=45,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=10)
SMPWaves=(WaveDuration=90,WaveDifficulty=5.500000,WaveMaxMonsters=24,MonsterNum[0]=11,MonsterNum[1]=13,MonsterNum[2]=17,MonsterNum[3]=21,MonsterNum[4]=23,MonsterNum[5]=45,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=11)
SMPWaves=(WaveDuration=90,WaveDifficulty=5.700000,WaveMaxMonsters=24,MonsterNum[0]=12,MonsterNum[1]=17,MonsterNum[2]=21,MonsterNum[3]=35,MonsterNum[4]=45,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=12)
SMPWaves=(WaveDuration=90,WaveDifficulty=6.000000,WaveMaxMonsters=16,MonsterNum[0]=14,MonsterNum[1]=15,MonsterNum[2]=34,MonsterNum[3]=0,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=14)
SMPWaves=(WaveDuration=90,WaveDifficulty=6.500000,WaveMaxMonsters=20,MonsterNum[0]=12,MonsterNum[1]=13,MonsterNum[2]=21,MonsterNum[3]=0,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=12)
SMPWaves=(WaveDuration=90,WaveDifficulty=6.900000,WaveMaxMonsters=20,MonsterNum[0]=13,MonsterNum[1]=14,MonsterNum[2]=15,MonsterNum[3]=34,MonsterNum[4]=0,MonsterNum[5]=0,MonsterNum[6]=0,MonsterNum[7]=0,MonsterNum[8]=0,MonsterNum[9]=0,MonsterNum[10]=0,MonsterNum[11]=0,MonsterNum[12]=0,MonsterNum[13]=0,MonsterNum[14]=0,MonsterNum[15]=0,FallBackMonsterNum=14)
