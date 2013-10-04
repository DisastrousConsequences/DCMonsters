class PoisonPupae extends SkaarjPupae;

var int PoisonLifespan;
var int PoisonModifier;
var bool SummonedMonster;
var RPGRules RPGRules;

function PostBeginPlay()
{
	Local GameRules G;
	super.PostBeginPlay();
	for(G = Level.Game.GameRulesModifiers; G != None; G = G.NextGameRules)
	{
		if(G.isA('RPGRules'))
		{
			RPGRules = RPGRules(G);
			break;
		}
	}

}

function PoisonTarget(Actor Victim, class<DamageType> DamageType)
{
	local DruidPoisonInv Inv;
	local Pawn P;

	if (DamageType == class'DamTypePoison' )
		return;

	P = Pawn(Victim);
	if (P != None)
	{
		Inv = DruidPoisonInv(P.FindInventoryType(class'DruidPoisonInv'));
		if (Inv == None)
		{
			Inv = spawn(class'DruidPoisonInv', P,,, rot(0,0,0));
			Inv.Modifier = PoisonModifier;
			Inv.LifeSpan = PoisonLifespan;
			Inv.RPGRules = RPGRules;
			Inv.GiveTo(P);
		}
		else
		{
			Inv.Modifier = max(PoisonModifier,Inv.Modifier);
			Inv.LifeSpan = max(PoisonLifespan,Inv.LifeSpan);
		}
	}
}

function bool MeleeDamageTarget(int hitdamage, vector pushdir)
{
	local vector HitLocation, HitNormal;
	local actor HitActor;
	
	// check if still in melee range
	if ( (Controller.Target != None) && (VSize(Controller.Target.Location - Location) <= MeleeRange * 1.4 + Controller.Target.CollisionRadius + CollisionRadius)
		&& ((Physics == PHYS_Flying) || (Physics == PHYS_Swimming) || (Abs(Location.Z - Controller.Target.Location.Z) 
			<= FMax(CollisionHeight, Controller.Target.CollisionHeight) + 0.5 * FMin(CollisionHeight, Controller.Target.CollisionHeight))) )
	{	
		HitActor = Trace(HitLocation, HitNormal, Controller.Target.Location, Location, false);
		if ( HitActor != None )
			return false;

		// hee hee  got a hit. Poison the dude
		PoisonTarget(Controller.Target, class'MeleeDamage');

		return super.MeleeDamageTarget(hitdamage, pushdir);
	}
	return false;
}

function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	if (SummonedMonster)
		Destroy();	// do not want to execute the invasion Killed function which decrements the number of monsters
	else
		Super.Died(Killer, damageType, HitLocation);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.Class == class'PoisonPupae' || P.Class == class'PoisonQueen' );
}

defaultproperties
{
     bCanStrafe=True
     GroundSpeed=+00500.000000
     Skins(0)=Texture'DCMonsters.Skins.PoisonPupae'
     Skins(1)=Texture'DCMonsters.Skins.PoisonPupae'
     PoisonLifespan=4
     PoisonModifier=2
     ScoringValue=2
     SummonedMonster=false
}
