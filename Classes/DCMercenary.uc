class DCMercenary extends SMPMercenary;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCMercenary');
}

defaultproperties
{
     MyDamageType=Class'DamTypeMercenaryAmmo'
     RocketAmmoClass=Class'MercenaryRocketAmmo'
     ControllerClass=Class'DCMonsterController'
}
