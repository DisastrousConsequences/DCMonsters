class DCMetalSkaarj extends SMPMetalSkaarj;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCMetalSkaarj');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}

