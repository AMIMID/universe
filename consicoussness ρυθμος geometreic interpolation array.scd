(
var data;
var az=0,el=0,az_rot;
var m=600,sph,az1,el1,pl=0,daz,del,harm,mag,r=1.neg;
var r1,harm1,r2,harm2,rad,call,mk=50,size=200;

~data=[];

1.do{

data = (128*32).collect{

	az=~az.[pl];
	el=~el.[pl];
	//mag=1000;
	 mag=(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt))+(Cartesian(~qx.[pl],~qy.[pl],~magz.[pl]).rho/(2.sqrt));
				// mag=(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt));
		// mag=~magz.[pl];
	pl=pl+1;
			mk=(mk+((size*2.pow(n/12))-((size*2.pow(n/12))/1.6180339887499))).wrap(0,size*2.pow(n/12));
		sph=Spherical(mag*mk/1.2,az,el).asCartesian.asArray;
};
	//pl=0;
	//mk=(mk+(1200-(1200/1.6180339887499))).wrap(0,1200);
	~data=~data++data;
};
// data=(128*32).collect{
//
// 	az=~az.[pl];
// 	el=~el.[pl];
// 	//mag=2;
// 	mag=
// 	(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt))+
// 	(Cartesian(~qx.[pl],~qy.[pl],~magz.[pl]).rho/(2.sqrt));
// 	//Cartesian(~magx.[pl],~magy.[pl],0).rho;
// 	//	Cartesian(~qx.[pl],~qy.[pl],0).rho;
// 	pl=pl+1;
// 	sph=Spherical(mag*400,az,el).asCartesian.asArray;
//
//
//
// };
// data.postln;

w = Window.new("3D Scatterplot", Rect(40,40, 1000, 800)).front;
a = ScatterView3d(w, Rect(0,0, 800,800), ~data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

// Y Slider
Slider(w, Rect(820, 10, 10, 450)).action_{|me|
    a.rotY = me.value * 2pi;
    w.refresh;
};
// X Slider
Slider(w, Rect(870, 10, 10, 450)).action_{|me|
    a.rotX = me.value * 2pi;
    w.refresh;
};
// Z Slider
Slider(w, Rect(920, 10, 10, 450)).action_{|me|
    a.rotZ = me.value * 2pi;
    w.refresh;
};

)





(
var data;
var az=0,el=0;
var m=600,sph,az1,el1,pl2=0,daz,del,harm,mag,r;
var r1,harm1,r2,harm2,rad;
var run = true,n=12;
var ot=0.degrad,mk=0,size=2.sqrt+100;

data = (4).collect{

	az=~az.[pl2];
	el=~el.[pl2];

	pl2=pl2+1;

		sph=Spherical(1000,az,el).asCartesian.asArray;
};

w = Window.new("3D Scatterplot", Rect(40,40, 800, 800)).front;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
a = ScatterView3d(~v, Rect(0,0, 800,800), data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 10;
a.symbolColor = Color.white;
a.background = Color.black;

~v.animate;
~v.drawFunc ={
Pen.translate(400,400);

		a.rot(ot,ot,ot);
    ~v.refresh;

		ot=ot+0.05.degrad;

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/1000).wait } }.fork(AppClock);
)


/////tetrahedron

(
~az=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];

)


//////rhythm tests

////Τετραεδρο ως control array του Ρυθμού. Μέτρο xyz. Με εναλλαγές στους χρόνους λόγο περιστροφής τετραεδρου σε γεοδεσικο πλαίσιο.
///Test models of rhythm (synthdef pattern)
///In control array rhytm file.  eg Cartsian tetrahedron xyz is 3/4 σε 4 μέτρα {χωρίς περιστροφή, μισή περίοδος (ολόκληρη περίοδος είναι δύο μέτρα)}, τετραδονιο τετραεδρο qxyz είναι 4/4 σε 4 μέτρα.

//////cartesian 3/4 rhythm τετράεδρο μέτρο
(
var pl=0,plx=1.neg,ply=1.neg,plz=1.neg;~dur=[];

~x=4.collect{
	plx=plx=1;
	Spherical(1,~az[plx],~el[plx]).rotate(0).x.round(0.001);	};
~y=4.collect{
	ply=ply=1;
	Spherical(1,~az[ply],~el[ply]).rotate(0).y.round(0.001);	};
~z=4.collect{
	plz=plz=1;
	Spherical(1,~az[plz],~el[plz]).rotate(0).z.round(0.001);	};

4.do{ ~dur=~dur++~x.[pl]++~y.[pl]++~z.[pl]; pl=pl+1;};

~dur=~dur.abs
)

///8metra xyz rh
(
var plm1=0,plm2=0,plx1=1.neg,ply1=1.neg,plz1=1.neg,plx2=1.neg,ply2=1.neg,plz2=1.neg;~dur=[];

~x1=4.collect{
	plx1=plx1=1;
	Spherical(1,~az[plx1],~el[plx1]).rotate(0).x.round(0.001);	};
~y1=3.collect{
	ply1=ply1=1;
	Spherical(1,~az[ply1],~el[ply1]).rotate(0).y.round(0.001);	};
~z1=4.collect{
	plz1=plz1=1;
	Spherical(1,~az[plz1],~el[plz1]).rotate(0).z.round(0.001);	};
~x2=4.collect{
	plx2=plx2=1;
	Spherical(1,~az[plx2],~el[plx2]).rotate(90).x.round(0.001);	};
~y2=4.collect{
	ply2=ply2=1;
	Spherical(1,~az[ply2],~el[ply2]).rotate(90).y.round(0.001);	};
~z2=4.collect{
	plz2=plz2=1;
	Spherical(1,~az[plz2],~el[plz2]).rotate(90).z.round(0.001);	};

4.do{ ~dur=~dur++~x1.[plm1]++~y1.[plm1]++~z1.[plm1]; plm1=plm1+1;};
4.do{ ~dur=~dur++~x2.[plm2]++~y2.[plm2]++~z2.[plm2]; plm2=plm2+1;};

~dur=~dur.abs
)



/////xyz metro can be used for dur of pattern and quaternion with 4 metro including the value of 0 can be used as amp argument for the synth envelope like L-system from previous examples. Musicaly this indicates the time or presence(amp) signature of each note and pauses etc.


/////quaternion 4/4 rhythm τετράεδρο μέτρο

//////////////////////with angle as argument, (along with Quaternion file
	//axis=i+j+k;
//////q1=((axis*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real); v1=q1*v1*q1.conjugate;

///////////use distance .distance between quaternions pl1 points as some kind of modulation
/*(
var q1,q2,dist;
q1=Quaternion(0,1,1,1); q2=Quaternion(0,0,0,0);
dist=q1.distance(q2);
dist.postln;)*/

(
var pl=0,plq=1.neg,pli=1.neg,plj=1.neg,plk=1.neg,i,j,k,axis,r,angle=90; ~tones=[];

axis=[1,1,1].normalizeSum.sqrt;
i=Quaternion(0, axis.[0], 0, 0);
j=Quaternion(0, 0, axis.[1], 0);
k=Quaternion(0, 0, 0, axis.[2]);
r=(cos(angle.degrad)+(sin(angle.degrad)*(i+j+k)));

~q=4.collect{
	plq=plq=1;
	(r*Quaternion(0,Spherical(1,~az[plq],~el[plq]).x,Spherical(1,~az[plq],~el[plq]).y,Spherical(1,~az[plq],~el[plq]).z)).a.round(0.001);	};
~i=4.collect{
	pli=pli=1;
	(r*Quaternion(0,Spherical(1,~az[pli],~el[pli]).x,Spherical(1,~az[pli],~el[pli]).y,Spherical(1,~az[pli],~el[pli]).z)).b.round(0.001);	};
~j=4.collect{
	plj=plj=1;
	(r*Quaternion(0,Spherical(1,~az[plj],~el[plj]).x,Spherical(1,~az[plj],~el[plj]).y,Spherical(1,~az[plj],~el[plj]).z)).c.round(0.001);	};
~k=4.collect{
	plk=plk=1;
	(r*Quaternion(0,Spherical(1,~az[plk],~el[plk]).x,Spherical(1,~az[plk],~el[plk]).y,Spherical(1,~az[plk],~el[plk]).z)).d.round(0.001);	};

4.do{ ~tones=~tones++~q.[pl]++~i.[pl]++~j.[pl]++~k.[pl]; pl=pl+1;};

~tones=~tones.abs
)



//////synth example

(
SynthDef.new(\R, {
	arg tone_signature;
var env,sig;
	env=EnvGen.ar(Env.perc(0.01,0.5,tone_signature));
		sig=Saw.ar(440,env);
	Out.ar([0,1],sig);

}).add;
)

//////////pattern

	(
		~rh=Pdef(\1, Pbind(\instrument, \R,
			\dur,Pseq(~dur,inf),
	\tone_signature,Pseq(~tones,inf);
		))
)



TempoClock.default.tempo_(1/2);


~rh.play;
