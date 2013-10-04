// BlastKrall - Krall firing yellow link primaries
class BlastKrall extends Krall;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	bSuperAggressive = (FRand() < 0.2);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'BlastKrall' );
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=Texture'XEffectMat.goop.SlimeSkin'
     Skins(1)=Texture'XEffectMat.goop.SlimeSkin'
     ScoringValue=4
     Health=130
     AmmunitionClass=Class'BlastKrallAmmo'
     ControllerClass=Class'DCMonsterController'
}
