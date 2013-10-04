class RedBioDecal extends xScorch;

simulated function BeginPlay()
{
	if ( !Level.bDropDetail && (FRand() < 0.5) )
		ProjTexture = texture'XEffects.BloodSplat2';
	Super.BeginPlay();
}

defaultproperties
{
	LifeSpan=6
	DrawScale=+0.65
	ProjTexture=texture'XEffects.BloodSplat1'
	bClipStaticMesh=True
    CullDistance=+7000.0
}
