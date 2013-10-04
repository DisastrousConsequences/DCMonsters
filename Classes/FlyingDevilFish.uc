class FlyingDevilFish extends SMPDevilFish;


function Landed(vector HitNormal)
{
	return;
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'FlyingDevilFish' );
}

function SetMovementPhysics()
{
	bFlopping = false;
	SetPhysics(PHYS_Flying);
}