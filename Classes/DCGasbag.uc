class DCGasbag extends Gasbag;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCGasbag');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
