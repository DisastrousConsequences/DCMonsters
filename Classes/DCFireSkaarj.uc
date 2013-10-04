class DCFireSkaarj extends FireSkaarj;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCFireSkaarj');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
