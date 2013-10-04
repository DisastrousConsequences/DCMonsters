class BeamWarLord extends WarLord;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'BeamWarlord' );
}

function FireProjectile()
{	
	local vector FireStart,X,Y,Z;
	
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

		Spawn(MyAmmo.ProjectileClass,,,FireStart,Controller.AdjustAim(SavedFireProperties,FireStart,600));
		PlaySound(FireSound,SLOT_Interact);
	}
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Health=500
     ScoringValue=10
     Skins(0)=FinalBlend'DCMonsters.Skins.BeamWarlordFB'
     Skins(1)=FinalBlend'DCMonsters.Skins.BeamWarlordFB'
     FireSound=Sound'WeaponSounds.ShockRifleAltFire'
     AmmunitionClass=Class'BeamWarlordAmmo'
     ControllerClass=Class'DCMonsterController'
}
