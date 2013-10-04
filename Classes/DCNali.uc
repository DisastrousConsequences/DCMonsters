class DCNali extends SMPNali;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCNali');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
