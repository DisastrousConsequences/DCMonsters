class DCNaliFighter extends SMPNaliFighter;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCNaliFighter');
}

defaultproperties
{
}
