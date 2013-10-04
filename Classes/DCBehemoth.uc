class DCBehemoth extends Behemoth;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCBehemoth');
}

defaultproperties
{
     AmmunitionClass=class'DCBehemothAmmo'
     ControllerClass=Class'DCMonsterController'
}
