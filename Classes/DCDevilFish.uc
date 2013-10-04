class DCDevilFish extends SMPDevilFish;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCDevilFish');
}

defaultproperties
{
}
