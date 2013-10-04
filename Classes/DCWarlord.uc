class DCWarlord extends Warlord;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCWarlord');
}

function FireProjectile()
{	
	local vector FireStart,X,Y,Z;
	local rotator ProjRot;
	local SeekingRocketProj S;
	if ( Controller != None )
	{
		GetAxes(Rotation,X,Y,Z);
		FireStart = GetFireStart(X,Y,Z);
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
		ProjRot = Controller.AdjustAim(SavedFireProperties,FireStart,600);
		if ( bRocketDir )
			ProjRot.Yaw += 3072; 
		else
			ProjRot.Yaw -= 3072; 
		bRocketDir = !bRocketDir;
		S = Spawn(class'DCWarlordRocket',,,FireStart,ProjRot);
		if (S != None)
        	S.Seeking = Controller.Enemy;
		PlaySound(FireSound,SLOT_Interact);
	}
}

defaultproperties
{
     AmmunitionClass=class'DCWarlordAmmo'
     ControllerClass=Class'DCMonsterController'
}
