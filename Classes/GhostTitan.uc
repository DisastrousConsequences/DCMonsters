class GhostTitan extends SMPTitan;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'GhostTitan' );
}

function SetMovementPhysics()
{
	SetPhysics(PHYS_Flying); 
}

simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType)
{
	Momentum = vect(0,0,0);		// its a ghost - you can't knock it back
	Super.TakeDamage( Damage, InstigatedBy, Hitlocation, Momentum, damageType);
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Health=700
     ScoringValue=15

     Skins(0)=FinalBlend'MutantSkins.Shaders.MutantGlowFinal'
     Skins(1)=None
     ControllerClass=Class'DCMonsterController'

     Mass=400.000000
     bCanFly=True
     GroundSpeed=+00200.000000
     WaterSpeed=100.000000
     AirSpeed=200.000000
     AccelRate=400.000000
     Buoyancy=80.000000

}
