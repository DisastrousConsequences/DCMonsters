class DCSkaarjTrooper extends SMPSkaarjTrooper;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCSkaarjTrooper');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
