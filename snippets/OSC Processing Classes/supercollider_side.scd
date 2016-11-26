////

a = List.new;
b = Dictionary.new;

(
x = { arg name,color1,color2,color3;
	m.sendMsg("/circle",color1,color2,color3);
	a.add(name);
	b.put(name,a.size());
};
)

x.value('hello',255,33,100);
x.value('new',33,84,33);
x.value('world',200,100,145);

(
z = {arg name, color1, color2, color3;
	m.sendMsg("/circleColor", b.at(name)-1, color1, color2, color3);
}
)

z.value('hello', 200, 200, 100);
z.value('new', 20, 123, 145);
z.value('world', 2, 255, 10);

z.value('world', 255, 255, 100);
z.value('hello', 20, 20, 200);
z.value('new', 155, 155, 155);


(
y = { arg name;
	m.sendMsg("/rcircle",b.at(name)-1);
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

