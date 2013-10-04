class GhostSkaarj extends IceSkaarj;

function SetMovementPhysics()
{
	SetPhysics(PHYS_Flying); 
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'GhostSkaarj' );
}

simulated function TakeDamage( int Damage, Pawn InstigatedBy, Vector Hitlocation, Vector Momentum, class<DamageType> damageType)
{
	Momentum = vect(0,0,0);		// its a ghost - you can't knock it back
	Super.TakeDamage( Damage, InstigatedBy, Hitlocation, Momentum, damageType);
}

defaultproperties
{
     ScoringValue=8
     health=170
     GibGroupClass=Class'XEffects.xBotGibGroup'
     DodgeAnims(2)="DodgeR"
     DodgeAnims(3)="DodgeL"
     Skins(0)=FinalBlend'MutantSkins.Shaders.MutantGlowFinal'
     Skins(1)=None
     ControllerClass=Class'DCMonsterController'

     Mass=80.000000
     bCanFly=True
     GroundSpeed=+00600.000000
     WaterSpeed=100.000000
     AirSpeed=600.000000
     AccelRate=900.000000
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

