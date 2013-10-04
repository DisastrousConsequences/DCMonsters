class DCGiantGasbag extends SMPGiantGasbag;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCGiantGasbag');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
