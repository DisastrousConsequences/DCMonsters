class	SpiderSlith	extends	SMPSlith;

function SetMovementPhysics()
{
	SetPhysics(PHYS_Spider);
}

simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType)
{
	Momentum = vect(0,0,0);		// its a spider - you can't knock it back
	Super.TakeDamage( Damage, InstigatedBy, Hitlocation, Momentum, damageType);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'SpiderSlith' );
}

defaultproperties
{
//     GibGroupClass=Class'XEffects.xBotGibGroup'
     ScoringValue=7
     Health=250
//     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
//     Skins(1)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
}
