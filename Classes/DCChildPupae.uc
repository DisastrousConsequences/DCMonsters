class DCChildPupae extends SMPChildPupae;

function TakeDamage(int Damage, Pawn EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType)
{
	super.TakeDamage( Damage,EventInstigator,HitLocation, Momentum, DamageType);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'DCPupae' || P.class == class'DCChildPupae' || P.class == class'DCQueen');
}

defaultproperties
{
     ScoringValue=0
}
