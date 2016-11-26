//// Functions for nxInt001

a = List.new;
b = Dictionary.new;

(
x = { arg name,color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation;
m.sendMsg("/nxInt001",color1,color2,color3,color4,freq,vol,positionX,positionY,width,rotation);
	a.add(name);
	b.put(name,a.size());
};
)

x.value('hello',255,33,100,50,60.0,200.5,4.0,2.0,10.0,0);
x.value('new',255,33,10,200,60.0,300.5,4.0,2.0,10.0,1);
x.value('world',255,33,100,100,200.0,200.5,2.0,2.0,10.0,2);

(
z = {arg name, color1, color2, color3,color4;
	m.sendMsg("/nxInt001color", b.at(name)-1, color1, color2, color3,color4);
}
)

z.value('hello', 200, 200, 100, 255);
z.value('new', 20, 123, 145,200);
z.value('world', 2, 255, 10,50);

z.value('world', 255, 255, 100,100);
z.value('hello', 20, 20, 200,100);
z.value('new', 155, 155, 155,100);


(
y = { arg name;
	m.sendMsg("/nxInt001clear",b.at(name)-1);
	a.removeAt(b.at(name)-1);
	b = Dictionary.new;
	a.size().do({|i| b.put(a[i],i+1)});
	a.postln;
	b.postln;
	}
)

y.value('new');
y.value('hello');
y.value('world');


/////////////////
//try class

~a.play(0);

~a = {NXInt001.ar(m,200,200,200,100,200.0,1.0,2.0,2.0,10.0,1)};

~a.set(\freq, 100);

~a.end(3);

~a = { arg freq = 100.0, vol = 0.5; NXInt001.ar(200,200,200,100,freq,vol,2.0,2.0,10.0,1)};

~a.set(\freq, 123);

~a.end(19);

NXInt;