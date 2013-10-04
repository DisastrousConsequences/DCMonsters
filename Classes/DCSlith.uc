class DCSlith extends SMPSlith;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCSlith');
}

defaultproperties
{
     AmmunitionClass=Class'SlithAmmo'
     ControllerClass=Class'DCMonsterController'
}
