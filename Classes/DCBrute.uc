class DCBrute extends Brute;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCBrute');
}

defaultproperties
{
     AmmunitionClass=class'DCBruteAmmo'
     ControllerClass=Class'DCMonsterController'
}
