class DCKrall extends Krall;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCKrall');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
