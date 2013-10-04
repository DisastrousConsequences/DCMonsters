class DCEliteKrall extends EliteKrall;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCEliteKrall');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
