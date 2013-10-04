class GhostBehemoth extends Behemoth;

function SetMovementPhysics()
{
	SetPhysics(PHYS_Flying); 
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'GhostBehemoth' );
}

simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType)
{
	Momentum = vect(0,0,0);		// its a ghost - you can't knock it back
	Super.TakeDamage( Damage, InstigatedBy, Hitlocation, Momentum, damageType);
}

defaultproperties
{
     ScoringValue=7
     Health=250
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=FinalBlend'MutantSkins.Shaders.MutantGlowFinal'
     Skins(1)=FinalBlend'MutantSkins.Shaders.MutantGlowFinal'
     ControllerClass=Class'DCMonsterController'
     AmmunitionClass=class'GhostBehemothAmmo'

     Mass=80.000000
     bCanFly=True
     GroundSpeed=+00300.000000
     WaterSpeed=100.000000
     AirSpeed=300.000000
     AccelRate=400.000000
     Buoyancy=80.000000

     MovementAnims(0)=WalkF
     MovementAnims(1)=WalkF
     MovementAnims(2)=WalkF
     MovementAnims(3)=WalkF
     SwimAnims(0)=WalkF
     SwimAnims(1)=WalkF
     SwimAnims(2)=WalkF
     SwimAnims(3)=WalkF
}
