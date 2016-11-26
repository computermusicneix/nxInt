// ~nx001

(
~nx001List = List.new;
~nx001Dict = Dictionary.new;
~nx001 = { arg name,color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation;
m.sendMsg("/nxInt001",color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation);
	~nx001List.add(name);
	~nx001Dict.put(name,~nx001List.size());
};
~nx001color = {arg name, color1, color2, color3,color4;
	m.sendMsg("/nxInt001color", ~nx001Dict.at(name)-1, color1, color2, color3,color4);
};
~nx001freq = {arg name, freq;
	m.sendMsg("/nxInt001freq", ~nx001Dict.at(name)-1, freq);
};
~nx001vol = {arg name, vol;
	m.sendMsg("/nxInt001vol", ~nx001Dict.at(name)-1, vol);
};
~nx001positionX = {arg name, positionX;
	m.sendMsg("/nxInt001positionX", ~nx001Dict.at(name)-1, positionX);
};
~nx001positionY = {arg name, positionY;
	m.sendMsg("/nxInt001positionY", ~nx001Dict.at(name)-1, positionY);
};
~nx001width = {arg name, width;
	m.sendMsg("/nxInt001width", ~nx001Dict.at(name)-1, width);
};
~nx001rotation = {arg name, rotation;
	m.sendMsg("/nxInt001rotation", ~nx001Dict.at(name)-1, rotation);
};
~nx001clear = { arg name;
	m.sendMsg("/nxInt001clear",~nx001Dict.at(name)-1);
	~nx001List.removeAt(~nx001Dict.at(name)-1);
	~nx001Dict = Dictionary.new;
	~nx001List.size().do({|i| ~nx001Dict.put(~nx001List[i],i+1)});
};
)

// Init a circle

(
~nx001.value("hello",
	rrand(0,255),
	rrand(0,255),
	rrand(0,255),
	rrand(100,255),
	rrand(60.0,200.0),
	rrand(10.5,100.0),
	2.0,2.0,
	rrand(1.0,10.0),
	rrand(0,2))
)

// Another

(
~nx001.value("world",
	rrand(0,255),
	rrand(0,255),
	rrand(0,255),
	rrand(100,255),
	rrand(60.0,200.0),
	rrand(10.5,100.0),
	2.0,2.0,
	rrand(1.0,10.0),
	rrand(0,2))
)

// changes

~nx001color.value("hello",rrand(0,255),rrand(0,255),rrand(0,255),100);

~nx001color.value("world",rrand(0,255),rrand(0,255),rrand(0,255),100);

// remove

~nx001clear.value("hello");
~nx001clear.value("world");

