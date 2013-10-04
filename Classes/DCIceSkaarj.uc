class DCIceSkaarj extends IceSkaarj;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCIceSkaarj');
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}
