class NullWarLord extends WarLord
	config(DCMonsters);

var config float MaxNullTime;

function FireProjectile()
{	
	local vector FireStart,X,Y,Z;
	local rotator ProjRot;
	local NullWarlordRocket NWR;
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
		NWR = Spawn(class'NullWarlordRocket',,,FireStart,ProjRot);
		if (NWR != None)
		{
			NWR.MaxNullTime = MaxNullTime;
			NWR.Seeking = Controller.Enemy;
			PlaySound(FireSound,SLOT_Interact);
		}
	}
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'NullWarlord' );
}

defaultproperties
{
     Health=500
     ScoringValue=10
     MaxNullTime=3.0
     Skins(0)=Shader'DCMonsters.Skins.darkWarlord'
     Skins(1)=Shader'DCMonsters.Skins.darkWarlord'
     AmmunitionClass=Class'NullWarlordAmmo'
     ControllerClass=Class'DCMonsterController'
}
