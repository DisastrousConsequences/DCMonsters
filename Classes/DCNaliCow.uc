class DCNaliCow extends SMPNaliCow;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCNaliCow');
}

defaultproperties
{
}
