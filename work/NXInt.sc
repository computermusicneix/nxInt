NXInt
{
  	var <host, <port;
 	var <width, <height;
	var <target;
	classvar <>nx001List;
	classvar <>nx001Dictionary;
	classvar <>nx001Name;
	classvar <outAddr;

	*new { |target,host = "127.0.0.1", port = 12000, width = 8, height = 8|
		nx001List = List.new;
		nx001Dictionary = Dictionary.new;
		^super.newCopyArgs(host, port, width, height).initNXInt;
	}
	initNXInt {
		outAddr = NetAddr(host, port);
		SynthDef(\nx001, { arg freq, vol;
			Out.ar(0, Pan2.ar(SinOsc.ar(freq, 0, vol),0));
		}).load(Server.default);
	}
	title { arg title;
		outAddr.sendMsg(\title, title);
	}
	nx001 { arg nx001Name,color1,color2,color3,color4,freq,vol,width,rotation;
		var synthname = (nx001Dictionary.at(nx001Name));
		outAddr.sendMsg(\nxInt001, color1,color2,color3,color4,LinLin.kr(freq,50.0,300.0,300.0,50.0),vol,width,rotation);
		nx001List.add(nx001Name);
		nx001Dictionary.put(nx001Name,nx001List.size());
		nx001List.postln;
		nx001Dictionary.postln;
		synthname = Synth(\nx001, [\freq, freq, \vol, vol]);
	}
	nx001clear { arg nx001Name;
		var synthname = (nx001Dictionary.at(nx001Name));
		outAddr.sendMsg(\nxInt001clear, nx001Dictionary.at(nx001Name)-1);
		nx001List.removeAt(nx001Dictionary.at(nx001Name)-1);
		nx001Dictionary = Dictionary.new;
		nx001List.size().do({|i| nx001Dictionary.put(nx001List[i], i+1)});
		nx001List.postln;
		nx001Dictionary.postln;
		synthname.free;
	}
	nx001freq {arg nx001Name,freq;
		var synthname = (nx001Dictionary.at(nx001Name));
		outAddr.sendMsg(\nxInt001freq, nx001Dictionary.at(nx001Name)-1,LinLin.kr(freq,50.0,300.0,300.0,50.0));
		synthname.set(\freq, freq);

	}
}
