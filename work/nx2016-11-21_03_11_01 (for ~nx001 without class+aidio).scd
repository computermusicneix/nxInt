// ~nx001

(
~nx001List = List.new;
~nx001Dict = Dictionary.new;
~nx001 = { arg name,color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation;
	~nx001List.add(name);
	~nx001Dict.put(name,~nx001List.size());
	Tdef(\send, {
		Ndef(name).play;
		0.1.wait;
		Ndef(name, { arg infreq, invol, rev;
			FreeVerb.ar(
			Pan2.ar(SinOsc.ar(infreq, 0, invol),0)
				,rev,rev,rev)
			});
		0.1.wait;
		Ndef(name).set(
			\infreq, freq,
			\invol, vol,
			\rev, LinLin.kr(width, 1.0, 100.0, 0.0, 0.8)
		);
        m.sendMsg("/nxInt001",
			color1,
		    color2,
			color3,
			color4,
			LinLin.kr(freq,50.0,300.0,300.0,50.0),
			LinLin.kr(vol,0.0,1.0,0.0,800.0),
			positionX,positionY,width,rotation);
	}).play;
};
~nx001color = {arg name, color1, color2, color3,color4;
	m.sendMsg("/nxInt001color", ~nx001Dict.at(name)-1, color1, color2, color3,color4);
};
~nx001freq = {arg name, freq;
	m.sendMsg("/nxInt001freq", ~nx001Dict.at(name)-1,
		LinLin.kr(freq,50.0,300.0,300.0,50.0)
	);
	Ndef(name).set(\infreq, freq);
};
~nx001vol = {arg name, vol;
	m.sendMsg("/nxInt001vol", ~nx001Dict.at(name)-1,LinLin.kr(vol,0.0,1.0,0.0,800.0));
	Ndef(name).set(\invol, vol);
};
~nx001positionX = {arg name, positionX;
	m.sendMsg("/nxInt001positionX", ~nx001Dict.at(name)-1, positionX);
};
~nx001positionY = {arg name, positionY;
	m.sendMsg("/nxInt001positionY", ~nx001Dict.at(name)-1, positionY);
};
~nx001width = {arg name, width;
	m.sendMsg("/nxInt001width", ~nx001Dict.at(name)-1, width);
	Ndef(name).set(\rev, \rev, LinLin.kr(width, 1.0, 100.0, 0.0, 0.8));
};
~nx001rotation = {arg name, rotation;
	m.sendMsg("/nxInt001rotation", ~nx001Dict.at(name)-1, rotation);
};
~nx001clear = { arg name;
	m.sendMsg("/nxInt001clear",~nx001Dict.at(name)-1);
	~nx001List.removeAt(~nx001Dict.at(name)-1);
	~nx001Dict = Dictionary.new;
	~nx001List.size().do({|i| ~nx001Dict.put(~nx001List[i],i+1)});
	Ndef(name).clear(0.5);
};
)

// Init a circle

(
~nx001.value(\hello,
	rrand(0,255),
	rrand(0,255),
    rrand(0,255),
	rrand(100,255),
	rrand(200.0,400.0),
	rrand(0.5,1.0),
	2.0,2.0,
	rrand(1.0,10.0),
	rrand(0,2))
)

// Another

(
~nx001.value(\world,
	rrand(0,255),
	rrand(0,255),
	rrand(0,255),
	rrand(100,255),
	rrand(60.0,200.0),
	rrand(0.5,1.0),
	2.0,2.0,
	rrand(1.0,10.0),
	rrand(0,2))
)

// changes

// freq (50.0 - 300.0)
~nx001freq.value(\hello, 200.0);
~nx001freq.value(\world, 100.0);

// vol (0.1 - 1.0)
~nx001vol.value(\hello, 0.5);
~nx001vol.value(\world, 0.5);


// width (1.0 - 100.0)
~nx001width.value(\hello, 25.0);
~nx001width.value(\world, 20.0);


// positionX [-1.0,0.0,1.0]

~nx001positionX.value(\hello, 1.25);



~nx001positionY.value(\hello, 2.0);



~nx001color.value(\hello,rrand(0,255),rrand(0,255),rrand(0,255),100);

~nx001color.value(\world,rrand(0,255),rrand(0,255),rrand(0,255),100);

// remove

~nx001clear.value(\hello);
~nx001clear.value(\world);

