class RockSlithProj extends SMPSlithProj;

simulated function HurtRadius( float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, vector HitLocation )
{
	local actor Victims;
	local float damageScale, dist;
	local vector dir;
	local int TakePercent, DamageVictimAdjust;
	local int OldHealth, HealthTaken;

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
				
            OldHealth = 0;
            DamageVictimAdjust = 1;
			if (Pawn(Victims) != None)
			{
			    OldHealth = Pawn(Victims).Health;
		        TakePercent = 0;
			    if (DruidBlock(Victims) != None)
			    {
		            DamageVictimAdjust = 16;
		            TakePercent = 25;
				}
				else if (vehicle(Victims) != None)
				{
		            DamageVictimAdjust = 4;
		            TakePercent = 10;
				}
			}

			Victims.TakeDamage
			(
				damageScale * DamageAmount * DamageVictimAdjust,
				Instigator,
				Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
				(damageScale * Momentum * dir),
				DamageType
			);
			if (Vehicle(Victims) != None && Vehicle(Victims).Health > 0)
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
			if (OldHealth > 0)
			{
			    // means this one was a pawn
			    if (Victims == None || Pawn(Victims).Health <= 0)
			        HealthTaken = OldHealth;
				else
				    HealthTaken = OldHealth - Pawn(Victims).Health;
				if (HealthTaken < 0)
				    HealthTaken = 0;
				// now take some health back
				if (HealthTaken > 0 && Instigator != None)
				{
					HealthTaken = max((HealthTaken * TakePercent)/100.0, 1);
					Instigator.GiveHealth(HealthTaken, Instigator.HealthMax);
				}
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

        OldHealth = 0;
        DamageVictimAdjust = 1;
		if (Pawn(Victims) != None)
		{
		    OldHealth = Pawn(Victims).Health;
	        TakePercent = 0;
		    if (DruidBlock(Victims) != None)
		    {
	            DamageVictimAdjust = 15;        // if invasion damage gets reduced to 40%
	            TakePercent = 20;
			}
			else if (vehicle(Victims) != None)
			{
	            DamageVictimAdjust = 3;
	            TakePercent = 10;
			}
		}

		Victims.TakeDamage
		(
			damageScale * DamageAmount * DamageVictimAdjust,
			Instigator,
			Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
			(damageScale * Momentum * dir),
			DamageType
		);
		if (Vehicle(Victims) != None && Vehicle(Victims).Health > 0)
			Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
		if (OldHealth > 0)
		{
		    // means this one was a pawn
		    if (Victims == None || Pawn(Victims).Health <= 0)
		        HealthTaken = OldHealth;
			else
			    HealthTaken = OldHealth - Pawn(Victims).Health;
			if (HealthTaken < 0)
			    HealthTaken = 0;
			// now take some health back
			if (HealthTaken > 0 && Instigator != None)
			{
				HealthTaken = max((HealthTaken * TakePercent)/100.0, 1);
				Instigator.GiveHealth(HealthTaken, Instigator.HealthMax);
			}
		}
	}

	bHurtEntry = false;
}

defaultproperties
{
    BaseDamage=40.0
    Damage=20.0
}
