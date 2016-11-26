~nx001List = List.new;
~nx001Dict = Dictionary.new;

(
~nx001 = { arg name,color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation;
m.sendMsg("/nxInt001",color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation);
	~nx001List.add(name);
	~nx001Dict.put(name,~nx001List.size());
};
)

~nx001.value('hello',255,33,100,50,60.0,200.5,4.0,2.0,10.0,0);
~nx001.value('new',255,33,10,200,60.0,300.5,4.0,2.0,10.0,1);
~nx001.value('world',255,33,100,100,200.0,200.5,2.0,2.0,10.0,2);

(
~nx001color = {arg name, color1, color2, color3,color4;
	m.sendMsg("/nxInt001color", ~nx001Dict.at(name)-1, color1, color2, color3,color4);
}
)

~nx001color.value('hello', 200, 200, 100, 255);
~nx001color.value('new', 20, 123, 145,200);
~nx001color.value('world', 2, 255, 10,50);

(
~nx001freq = {arg name, freq;
	m.sendMsg("/nxInt001freq", ~nx001Dict.at(name)-1, freq);
}
)

~nx001freq.value('hello', 200.0);
~nx001freq.value('new', 123.0);
~nx001freq.value('world', 50.0);

(
~nx001vol = {arg name, vol;
	m.sendMsg("/nxInt001vol", ~nx001Dict.at(name)-1, vol);
}
)

~nx001vol.value('hello', 0.5);
~nx001vol.value('new', 0.75);
~nx001vol.value('world', 1.0);

(
~nx001positionX = {arg name, positionX;
	m.sendMsg("/nxInt001positionX", ~nx001Dict.at(name)-1, positionX);
}
)

~nx001positionX.value('hello', 2.0);
~nx001positionX.value('new', 1.0);
~nx001positionX.value('world', 5.0);

(
~nx001positionY = {arg name, positionY;
	m.sendMsg("/nxInt001positionY", ~nx001Dict.at(name)-1, positionY);
}
)

~nx001positionY.value('hello', 2.0);
~nx001positionY.value('new', 3.0);
~nx001positionY.value('world', 5.0);

(
~nx001width = {arg name, width;
	m.sendMsg("/nxInt001width", ~nx001Dict.at(name)-1, width);
}
)

~nx001width.value('hello', 20.0);
~nx001width.value('new', 23.0);
~nx001width.value('world', 5.0);

(
~nx001rotation = {arg name, rotation;
	m.sendMsg("/nxInt001rotation", ~nx001Dict.at(name)-1, rotation);
}
)

~nx001rotation.value('hello', 0);
~nx001rotation.value('new', 1);
~nx001rotation.value('world', 2);

(
~nx001clear = { arg name;
	m.sendMsg("/nxInt001clear",~nx001Dict.at(name)-1);
	~nx001List.removeAt(~nx001Dict.at(name)-1);
	~nx001Dict = Dictionary.new;
	~nx001List.size().do({|i| ~nx001Dict.put(~nx001List[i],i+1)});
	}
)

~nx001clear.value('new');
~nx001clear.value('hello');
~nx001clear.value('world');