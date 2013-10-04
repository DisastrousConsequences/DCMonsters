class DCRazorFly extends RazorFly;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCRazorFly');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
