class DCSkaarjSniper extends SMPSkaarjSniper;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCSkaarjSniper');
}

defaultproperties
{
     DamageType=Class'DamTypeDCSniperShot'
     DamageTypeHeadShot=Class'DamTypeDCSniperHeadShot'
     ControllerClass=Class'DCMonsterController'
}
