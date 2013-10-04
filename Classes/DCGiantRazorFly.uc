class DCGiantRazorFly extends SMPGiantRazorFly;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCGiantRazorFly');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
