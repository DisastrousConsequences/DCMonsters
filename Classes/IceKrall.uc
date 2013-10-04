// IceKrall - Krall firing freezing primaries
class IceKrall extends Krall;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	bSuperAggressive = (FRand() < 0.2);
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'IceKrall' );
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=FinalBlend'DCMonsters.Skins.IceKrallFB'
     Skins(1)=FinalBlend'DCMonsters.Skins.IceKrallFB'
     ScoringValue=5
     Health=140
     AmmunitionClass=Class'IceKrallAmmo'
     ControllerClass=Class'DCMonsterController'
}
