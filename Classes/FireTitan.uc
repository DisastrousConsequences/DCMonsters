class FireTitan extends SMPTitan;

var RPGRules RPGRules;
var Material BurnOverlay;

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

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'FireTitan' || P.class == class'DCTitan' || P.class == class'DCStoneTitan');
}

function Stomp()
{
}

function FootStep()
{
}

function PunchDamageTarget()
{
	if(Controller==none || Controller.Target==none) return;
	if (MeleeDamageTarget(PunchDamage, (40000.0 * Normal(Controller.Target.Location - Location))) )
	{
		PlaySound(Slap, SLOT_Interact);
		PlaySound(Slap, SLOT_Misc);
		if (FRand() < 0.6)
		    class'FireTitan'.static.BurnTarget(Controller.Target, 0.08, RPGRules);
	}
}
function SlapDamageTarget()
{
	local vector X,Y,Z;
	if(Controller==none || Controller.Target==none) return;
	GetAxes(Rotation,X,Y,Z);

	if ( MeleeDamageTarget(SlapDamage, (40000.0 * ( Y + vect(0,0,1)))) )
	{
		PlaySound(Slap, SLOT_Interact);
		PlaySound(Slap, SLOT_Misc);
		if (FRand() < 0.7)
		    class'FireTitan'.static.BurnTarget(Controller.Target, 0.08, RPGRules);
	}
}

static function BurnTarget(Actor Victim, float BurnLevel, RPGRules R)
{
	local DruidBurnInv BInv;
	local Pawn P;

	P = Pawn(Victim);
	if (P != None)
	{
		BInv = DruidBurnInv(P.FindInventoryType(class'DruidBurnInv'));
		if (BInv == None)
		{
			BInv = P.spawn(class'DruidBurnInv', P,,, rot(0,0,0));
			BInv.BurnFraction = BurnLevel;
			BInv.LifeSpan = 4;
			BInv.RPGRules = R;
			BInv.GiveTo(P);
			P.SetOverlayMaterial(class'FireTitan'.default.BurnOverlay, 4.0, false);
		}
		else
		{
		    if (BInv.BurnFraction < BurnLevel)
				BInv.BurnFraction = BurnLevel;
			BInv.LifeSpan = 4;
		}
	}
}

function SpawnRock()
{
	local vector X,Y,Z, FireStart;
	local rotator FireRotation;
	local Projectile   Proj;

	GetAxes(Rotation,X,Y,Z);
	FireStart = Location + 1.2*CollisionRadius * X + 0.4 * CollisionHeight * Z;
	if ( !SavedFireProperties.bInitialized )
	{
		SavedFireProperties.AmmoClass = MyAmmo.Class;
		SavedFireProperties.ProjectileClass = MyAmmo.ProjectileClass;
		SavedFireProperties.WarnTargetPct = MyAmmo.WarnTargetPct;
		SavedFireProperties.MaxRange = MyAmmo.MaxRange;
		SavedFireProperties.bTossed = MyAmmo.bTossed;
		SavedFireProperties.bTrySplash = MyAmmo.bTrySplash;
		SavedFireProperties.bLeadTarget = MyAmmo.bLeadTarget;
		SavedFireProperties.bInstantHit = MyAmmo.bInstantHit;
		SavedFireProperties.bInitialized = true;
	}

	FireRotation = Controller.AdjustAim(SavedFireProperties,FireStart,600);

	Proj=Spawn(MyAmmo.ProjectileClass,,,FireStart,FireRotation);
	if(Proj!=none)
	{
		Proj.SetPhysics(PHYS_Projectile);
		Proj.setDrawScale(Proj.DrawScale*DrawScale/default.DrawScale);
		Proj.SetCollisionSize(Proj.CollisionRadius*DrawScale/default.DrawScale,Proj.CollisionHeight*DrawScale/default.DrawScale);
		Proj.Velocity = (ProjectileSpeed+Rand(ProjectileMaxSpeed-ProjectileSpeed)) *vector(Proj.Rotation)*DrawScale/default.DrawScale;
	}
	if (FRand() < 0.4)
	{
	    // throw a second one
		FireStart=Location + 1.2*CollisionRadius * X -40*Y+ 0.4 * CollisionHeight * Z;
		Proj=Spawn(MyAmmo.ProjectileClass,,,FireStart,FireRotation);
		if(Proj!=none)
		{
			Proj.SetPhysics(PHYS_Projectile);
			Proj.setDrawScale(Proj.DrawScale*DrawScale/default.DrawScale);
			Proj.SetCollisionSize(Proj.CollisionRadius*DrawScale/default.DrawScale,Proj.CollisionHeight*DrawScale/default.DrawScale);
			Proj.Velocity = (ProjectileSpeed+Rand(ProjectileMaxSpeed-ProjectileSpeed)) *vector(Proj.Rotation)*DrawScale/default.DrawScale;
		}
	}
	bStomped=false;
	ThrowCount++;
	if(ThrowCount>=4)
	{
		bThrowed=true;
		ThrowCount=0;
	}
}

defaultproperties
{
     MonsterName="Fire Titan"
     AmmunitionClass=Class'TitanFireBallAmmo'
     ScoringValue=14
     MeleeRange=120.000000
     GroundSpeed=600.000000
     AccelRate=2400.000000
     JumpZ=0.000000
     Health=750
     Skins(0)=TexScaler'EpicParticles.Shaders.TexScaler2'  
     Skins(1)=TexScaler'EpicParticles.Shaders.TexScaler2'   
     DrawScale=0.800000
     CollisionRadius=90.000000
     CollisionHeight=100.000000
     Mass=1600.000000
     SlapDamage=45
     PunchDamage=40
     BurnOverlay=Texture'AW-2004Particles.Cubes.RedS1'
     ControllerClass=Class'DCMonsterController'
}
