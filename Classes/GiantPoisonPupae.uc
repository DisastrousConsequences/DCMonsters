class GiantPoisonPupae extends PoisonPupae; //SkaarjPupae;

singular function Bump(actor Other)
{
	local name Anim;
	local float frame,rate;

	if ( bShotAnim && bLunging )
	{
		bLunging = false;
		GetAnimParams(0, Anim,frame,rate);
		if ( Anim == 'Lunge' )
			MeleeDamageTarget(40, (20000.0 * Normal(Controller.Target.Location - Location)));
	}
	Super.Bump(Other);
}

function RangedAttack(Actor A)
{
	local float Dist;

	if ( bShotAnim )
		return;

	Dist = VSize(A.Location - Location);
	if ( Dist > 500 )
		return;
	bShotAnim = true;
	PlaySound(ChallengeSound[Rand(4)], SLOT_Interact);
	if ( Dist < MeleeRange + CollisionRadius + A.CollisionRadius )
	{
  		if ( FRand() < 0.5 )
  			SetAnimAction('Bite');
  		else
  			SetAnimAction('Stab');
		MeleeDamageTarget(40, vect(0,0,0));
		Controller.bPreparingMove = true;
		Acceleration = vect(0,0,0);
		return;
	}

	// lunge at enemy
	bLunging = true;
	Enable('Bump');
	SetAnimAction('Lunge');
	Velocity = 500 * Normal(A.Location + A.CollisionHeight * vect(0,0,0.75) - Location);
	if ( dist > CollisionRadius + A.CollisionRadius + 35 )
		Velocity.Z += 0.7 * dist;
	SetPhysics(PHYS_Falling);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.Class == class'GiantPoisonPupae' );
}

defaultproperties
{
     bCanStrafe=True
     GroundSpeed=+00600.000000
     JumpZ=+00500.000000
     PoisonLifespan=4
     PoisonModifier=4
     ScoringValue=5
     SummonedMonster=false
     Health=140
     MeleeRange=+0025.000000
     CollisionRadius=+00060.000000
     CollisionHeight=+00025.000000
     Mass=+00200.000000
     DrawScale=2.200000
}
