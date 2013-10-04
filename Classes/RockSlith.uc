class RockSlith extends SMPSlith;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'RockSlith');
}

function ClawDamageTarget()
{

	if ( MeleeDamageTarget(ClawDamage, ClawDamage * 1000.0 * Normal(Controller.Target.Location - Location)))
	{}
}

function bool MeleeDamageTarget(int hitdamage, vector pushdir)
{
	local int OldHealth, HealthTaken, TakePercent;


	// increase damage if a block or vehicle
	If ( (Controller.target != None) && Pawn(Controller.target) != None  && Pawn(Controller.target).Health > 0)
	{
	    OldHealth = Pawn(Controller.target).Health;
        TakePercent = 0;
	    if (DruidBlock(Controller.target) != None)
	    {
            hitdamage *= 16;        // if invasion damage to block will get reduced to 40%
            TakePercent = 30;
		}
		else if (vehicle(Controller.target) != None)
		{
            hitdamage *= 4;
            TakePercent = 15;
		}
	}

	if (super.MeleeDamageTarget(hitdamage, pushdir))
	{
	    // hit it
	    if (Controller.target == None || Pawn(Controller.target).Health <= 0)
	        HealthTaken = OldHealth;
		else
		    HealthTaken = OldHealth - Pawn(Controller.target).Health;
		if (HealthTaken < 0)
		    HealthTaken = 0;
		// now take some health back
		if (HealthTaken > 0)
		{
			HealthTaken = max((HealthTaken * TakePercent)/100.0, 1);
			GiveHealth(HealthTaken, HealthMax);
		}

		return true;
	}

	return false;
}

function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	local RPGRules Rules;
 	Local GameRules G;
 	local RPGStatsInv StatsInv;

	ScoringValue=5;      // since get 1 xp for killing already, makes final score 6

	// died, so up our score so give the killer some xp and adrenaline
	if ( bDeleteMe || Level.bLevelChange || Level.Game == None )
		return; // already destroyed, or level is being cleaned up

	for(G = Level.Game.GameRulesModifiers; G != None; G = G.NextGameRules)
	{
		if(G.isA('RPGRules'))
		{
			Rules = RPGRules(G);
			break;
		}
	}
	if (Rules != None && Killer != None && Killer.Pawn != None && self != None)
	{
	    StatsInv = RPGStatsInv(Killer.Pawn.FindInventoryType(class'RPGStatsInv'));
	    if (StatsInv != None)
			Rules.ShareExperience(StatsInv, ScoringValue);
	}

	Super.Died( Killer, damageType, HitLocation);
}

defaultproperties
{
     AmmunitionClass=Class'RockSlithAmmo'        // does more damage to blocks
     ControllerClass=Class'RockMonsterController'

     ClawDamage=100
     MonsterName="Rock Slith"
     ScoringValue=0     	// pay back differently to avoid constant healing/damage exploit
     Health=1000
 	 skins(0)=Texture'DCText.blocks.box_1'        	// jbrute1
     Skins(1)=Texture'DCText.blocks.box_1'
     MeleeRange=90.000000
     GroundSpeed=300.000000
     CollisionRadius=85.000000
     CollisionHeight=83.000000
     Mass=700.000000
     DrawScale=1.7
}
