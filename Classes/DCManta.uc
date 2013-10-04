class DCManta extends Manta;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCManta');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
