NXInt001 {
	classvar
	<>list,
	<>dict,
	<>name,
	<>color1,
	<>color2,
	<>color3,
	<>color4,
	<>freq,
	<>vol,
	<>positionX,
	<>positionY,
	<>width,
	<>rotation,
	osc;

	*ar { arg color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation;
		SinOsc.ar(freq,0,vol)};

	}
}
