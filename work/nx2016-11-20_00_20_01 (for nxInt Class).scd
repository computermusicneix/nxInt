
// Class NXInt

// Init class

a = NXInt.new();

// Send title

a.title("Hello World");

// Init the generator

~a.play(0);

~a = { a.nx001('hello',10,20,200,100,100.0,300.0,2.0,2.0,5.0,0) };

a.nx001clear('hello');~a.end(0.1);
~a = nil;


~b.play(1);

~b = { a.nx001('world',150,20,20,100,200.0,300.0,2.0,2.0,5.0,2) };

a.nx001clear('world');~b.end(0.1);
~b = nil;
