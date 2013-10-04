class GhostSlith extends SMPSlith;

function SetMovementPhysics()
{
	SetPhysics(PHYS_Flying); 
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'GhostSlith' );
}

simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType)
{
	Momentum = vect(0,0,0);		// its a ghost - you can't knock it back
	Super.TakeDamage( Damage, InstigatedBy, Hitlocation, Momentum, damageType);
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     ScoringValue=7
     Health=200
     Skins(0)=FinalBlend'MutantSkins.Shaders.MutantGlowFinal'
     Skins(1)=FinalBlend'MutantSkins.Shaders.MutantGlowFinal'
     ControllerClass=Class'DCMonsterController'

     Mass=80.000000
     bCanFly=True
     GroundSpeed=+00400.000000
     WaterSpeed=100.000000
     AirSpeed=400.000000
     AccelRate=700.000000
     Buoyancy=80.000000

}
