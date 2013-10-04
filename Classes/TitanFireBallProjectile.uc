class TitanFireBallProjectile extends FireBallProjectile;

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

function Timer()
{
    SetCollisionSize(30, 30);
}

simulated function HurtRadius( float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, vector HitLocation )
{
	local actor Victims;
	local float damageScale, dist;
	local vector dir;
	local bool VictimPawn;

	if ( bHurtEntry )
		return;

	bHurtEntry = true;
	foreach VisibleCollidingActors( class 'Actor', Victims, DamageRadius, HitLocation )
	{
		// don't let blast damage affect fluid - VisibleCollisingActors doesn't really work for them - jag
		if( (Victims != self) && (Hurtwall != Victims) && (Victims.Role == ROLE_Authority) && !Victims.IsA('FluidSurfaceInfo') )
		{
			dir = Victims.Location - HitLocation;
			dist = FMax(1,VSize(dir));
			dir = dir/dist;
			damageScale = 1 - FMax(0,(dist - Victims.CollisionRadius)/DamageRadius);
			if ( Instigator == None || Instigator.Controller == None )
				Victims.SetDelayedDamageInstigatorController( InstigatorController );
			if ( Victims == LastTouched )
				LastTouched = None;
			VictimPawn = false;
			if (Pawn(Victims) != None)
			{
				VictimPawn = true;
			}
			Victims.TakeDamage
			(
				damageScale * DamageAmount,
				Instigator,
				Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
				(damageScale * Momentum * dir),
				DamageType
			);
			//now see if we killed it
			if (VictimPawn)
			{
				if (Victims == None || Pawn(Victims) == None || Pawn(Victims).Health <= 0 )
					class'ArtifactLightningBeam'.static.AddArtifactKill(Instigator, class'WeaponFireBall');	// assume killed
				else
				{
				    if (damageScale > 0.1 && FRand() < 0.7 && Monster(Instigator) != none && !Monster(Instigator).SameSpeciesAs(Pawn(Victims)))
				    {
				        // Burn
				        class'FireTitan'.static.BurnTarget(Victims, damageScale * 0.2, RPGRules);
				    }
				}
			}
			if (Victims != None)
			{
				if (Vehicle(Victims) != None && Vehicle(Victims).Health > 0)
					Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
			}
		}
	}
	if ( (LastTouched != None) && (LastTouched != self) && (LastTouched.Role == ROLE_Authority) && !LastTouched.IsA('FluidSurfaceInfo') )
	{
		Victims = LastTouched;
		LastTouched = None;
		dir = Victims.Location - HitLocation;
		dist = FMax(1,VSize(dir));
		dir = dir/dist;
		damageScale = FMax(Victims.CollisionRadius/(Victims.CollisionRadius + Victims.CollisionHeight),1 - FMax(0,(dist - Victims.CollisionRadius)/DamageRadius));
		if ( Instigator == None || Instigator.Controller == None )
			Victims.SetDelayedDamageInstigatorController(InstigatorController);
		VictimPawn = false;
		if (Pawn(Victims) != None)
		{
			VictimPawn = true;
		}
		Victims.TakeDamage
		(
			damageScale * DamageAmount,
			Instigator,
			Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
			(damageScale * Momentum * dir),
			DamageType
		);
		//now see if we killed it
		if (VictimPawn)
		{
			if (Victims == None || Pawn(Victims) == None || Pawn(Victims).Health <= 0 )
				class'ArtifactLightningBeam'.static.AddArtifactKill(Instigator, class'WeaponFireBall');	// assume killed
			else
			{
			    if (damageScale > 0.1 && FRand() < 0.7 && Monster(Instigator) != none && !Monster(Instigator).SameSpeciesAs(Pawn(Victims)))
			    {
			        // Burn
				    class'FireTitan'.static.BurnTarget(Victims, damageScale * 0.2, RPGRules);
			    }
			}
		}
		if (Victims != None)
		{
			if (Vehicle(Victims) != None && Vehicle(Victims).Health > 0)
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
		}
	}

	bHurtEntry = false;
}

simulated function Explode(vector HitLocation,vector HitNormal)
{
	local PlayerController PC;

	PlaySound(sound'WeaponSounds.BExplosion3',,2.5*TransientSoundVolume);
    if ( EffectIsRelevant(Location,false) )
    {
    	Spawn(class'ONSVehicleExplosionEffect',,,HitLocation + HitNormal*20,rotator(HitNormal));
    	PC = Level.GetLocalPlayerController();
		if ( (PC.ViewTarget != None) && VSize(PC.ViewTarget.Location - Location) < 5000 )
	        Spawn(class'ExplosionCrap',,, HitLocation + HitNormal*20, rotator(HitNormal));
	}
    if ( Role == ROLE_Authority )
    {
        HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation );
    }
	SetCollisionSize(0.0, 0.0);
	Destroy();
}

defaultproperties
{
    Speed=3000
    MaxSpeed=4000
    Damage=300
    DamageRadius=350
    DrawScale=0.45
    CollisionRadius=30
    CollisionHeight=30
    bNetTemporary=False  // not really necessary, but there will not be many of them and this allows the def sent to shoot them out
}
