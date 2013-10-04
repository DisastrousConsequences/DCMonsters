class DCMercenaryElite extends SMPMercenaryElite;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCMercenaryElite');
}

defaultproperties
{
     MyDamageType=Class'DamTypeEliteMercenaryAmmo'
     RocketAmmoClass=Class'EliteMercenaryRocketAmmo'
     ControllerClass=Class'DCMonsterController'
}
