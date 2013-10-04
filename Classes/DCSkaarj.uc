class DCSkaarj extends Skaarj;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCSkaarj');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
