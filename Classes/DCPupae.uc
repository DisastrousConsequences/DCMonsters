class DCPupae extends SkaarjPupae;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCPupae' || P.class == class'DCChildPupae' || P.class == class'DCQueen');
}

defaultproperties
{
}
