// LaserKrall - Krall firing shock primary
class LaserKrall extends Krall;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	bSuperAggressive = (FRand() < 0.5);
	SetInvisibility(30.0);

}

function RangedAttack(Actor A)
{
	if ( bShotAnim )
		return;

	SetInvisibility(0.0);
	if ( bLegless )
		SetAnimAction('Shoot3');
	else if ( Physics == PHYS_Swimming )
		SetAnimAction('SwimFire');
	else if ( VSize(A.Location - Location) < MeleeRange + CollisionRadius + A.CollisionRadius )
	{
		PlaySound(sound'strike1k',SLOT_Talk);
		SetAnimAction(MeleeAttack[Rand(5)]);
	}	
	else
	{
		if ( bSuperAggressive && !Controller.bPreparingMove && Controller.InLatentExecution(Controller.LATENT_MOVETOWARD) )
		{
			SetInvisibility(30.0);
			return;
		}
		if ( Controller.InLatentExecution(501) ) // LATENT_MOVETO
			return;
		SetAnimAction('Shoot1');
	}
	Controller.bPreparingMove = true;
	Acceleration = vect(0,0,0);
	bShotAnim = true;
}


function StrikeDamageTarget()
{
	local vector locMom;
	if (Controller != None && Controller.Target != None )
		locMom = 21000 * Normal(Controller.Target.Location - Location);
	else 
		locMom = vect(0,0,0);

	if (MeleeDamageTarget(20, locMom))
		PlaySound(sound'hit2k',SLOT_Interact);
	If (frand() > 0.1) SetInvisibility(60.0);
}

function SpawnShot()
{
	FireProjectile();
	SetInvisibility(60.0);
}

function ThrowDamageTarget()
{
	bAttackSuccess = MeleeDamageTarget(30, vect(0,0,0));
	if ( bAttackSuccess )
		PlaySound(sound'hit2k',SLOT_Interact);
	If (frand() > 0.2) SetInvisibility(60.0);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'LaserKrall' );
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     ScoringValue=6
     Health=200

     AmmunitionClass=Class'LaserKrallAmmo'
     ControllerClass=Class'DCMonsterController'
}
