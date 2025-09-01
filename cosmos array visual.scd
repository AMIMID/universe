(
var data;
var az=0,el=0,az_rot;
var m=600,sph,az1,el1,pl=0,daz,del,harm,mag,r=1.neg;
var r1,harm1,r2,harm2,rad,call,mk=50;

~data=[];

1.do{

data = (128*32).collect{

	az=~az.[pl];
	el=~el.[pl];
	//mag=1000;
	// mag=(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt))+(Cartesian(~qx.[pl],~qy.[pl],~magz.[pl]).rho/(2.sqrt));
			//	 mag=(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt));
		 mag=~magz.[pl];
	pl=pl+1;
			mk=(mk+(1200-(1200/1.6180339887499))).wrap(0,1200);
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
var m=600,sph,az1,el1,pl=0,daz,del,harm,mag,r;
var r1,harm1,r2,harm2,rad;
var run = true,n=12;
var ot=0.degrad,mk=0,size=2000;
~data=[];

1.do{

data = (89*5*8).collect{

	az=~az.[pl];
	el=~el.[pl];
	//mag=1000;
	// mag=(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt))+(Cartesian(~qx.[pl],~qy.[pl],~magz.[pl]).rho/(2.sqrt));
				 mag=(Cartesian(~magx.[pl],~magy.[pl],~magz.[pl]).rho/(2.sqrt));
		// mag=~magz.[pl];
	pl=pl+1;
			mk=(mk+((size*2.pow(n/12))-((size*2.pow(n/12))/1.6180339887499))).wrap(0,size*2.pow(n/12));
		//mk=(mk+1);
		sph=Spherical(mag*(size/5),az,el).asCartesian.asArray;
};
	//pl=0;
	//mk=(mk+(1200-(1200/1.6180339887499))).wrap(0,1200);
	~data=~data++data;
};

w = Window.new("3D Scatterplot", Rect(40,40, 800, 800)).front;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
a = ScatterView3d(~v, Rect(0,0, 800,800), ~data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

~v.animate;
~v.drawFunc ={
Pen.translate(400,400);

		a.rot(ot,ot,ot);
    ~v.refresh;

		ot=ot+0.5.degrad;

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/1000).wait } }.fork(AppClock);
)


/////////////
(
{
var sph1,sph2,sph3,sph4,sph5,sph6,sph7,m_x=0,m_y=0,m_z=0,qx,qy,mq=2;
var sph11,sph22,sph33,sph44,sph55,sph66,sph77,sphx,sphy,sphz,sphqx,sphqy;
var az1=0,el1=0,az2=0,el2=0,az3=0,el3=0,mag,mag_x,mag_y,mag_z,mag_qx,mag_qy;
var az11=0,el11=0,az22=0,el22=0,az33=0,el33=0,az44=0,el44=0,az55=0,el55=0,az66=0,el66=0,az77=0,el77=0;
var az4=0,el4=0,az5=0,el5=0,az6=0,el6=0,az7=0,el7=0;
var azimuth,elevation,magnitudex,magnitudey,magnitudez;
var angle=0,n=12,scale=50,num=1.neg,ellipsis=[1,1,1],spread=1;
var mag1=1,mag2=1,mag3=1,mag4=1,mag5=1,mag6=1,mag7=1;

	~az=[];~el=[];~magx=[];~magy=[];~magz=[];~qx=[];~qy=[];
//	spread = if(m_z < 1) { 1 / m_z } { m_z };

	89.do{

5.do{
			az1 = (az1+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el1 = (el1+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
			sph1=(Spherical(mag1,(az1.degrad+angle.degrad).wrap(pi.neg,pi),(el1.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az11=az1;el11=el1;

	azimuth=8.collect{
				az11 = (az11+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el11 = (el11+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph11=(Spherical(mag1/scale,(az11.degrad+angle.degrad).wrap(pi.neg,pi),(el11.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
				(sph1.asCartesian.round(0.000000000001)-sph11.asCartesian.round(0.000000000001)).asSpherical.theta.round(0.000000000001);
			};~az=~az++azimuth;};

5.do{
			az2 = (az2+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el2 = (el2+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
			sph2=(Spherical(mag2,(az2.degrad+angle.degrad).wrap(pi.neg,pi),(el2.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az22=az2;el22=el2;

	elevation=8.collect{
				az22=az2;el22=el2;
				az22 = (az22+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el22 = (el22+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph22=(Spherical(mag2/scale,(az22.degrad+angle.degrad).wrap(pi.neg,pi),(el22.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
				(sph2.asCartesian.round(0.000000000001)-sph22.asCartesian.round(0.000000000001)).asSpherical.phi.round(0.000000000001);
			};~el=~el++elevation;};

5.do{
			az3 = (az3+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el3 = (el3+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
	sph3=(Spherical(mag3,(az3.degrad+angle.degrad).wrap(pi.neg,pi),(el3.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az33=az3;el33=el3;

	magnitudex=8.collect{
				az33=az3;el33=el3;
				az33 = (az33+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el33 = (el33+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph33=(Spherical(mag3/scale,(az33.degrad+angle.degrad).wrap(pi.neg,pi),(el33.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));

	 mag_x=((Complex(cos((sph3.theta.round(0.000000000001)*m_x).wrap(pi.neg,pi)),cos((sph3.theta.round(0.000000000001)*m_x).wrap(pi.neg,pi))).rho/(2.sqrt)).pow(spread)*
			(Complex(cos((sph3.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2))),cos((sph3.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2)))).rho/(2.sqrt)).pow(spread));
	sphx=(Spherical(mag_x,sph3.theta,sph3.phi).asCartesian.round(0.000000000001)-Spherical(mag_x/scale,sph33.theta,sph33.phi).asCartesian.round(0.000000000001)).asSpherical.rho;
			};~magx=~magx++magnitudex;};

5.do{
			az4 = (az4+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el4 = (el4+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
	sph4=(Spherical(mag4,(az4.degrad+angle.degrad).wrap(pi.neg,pi),(el4.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az44=az4;el44=el4;

	magnitudey=8.collect{
				az44=az4;el44=el4;
				az44 = (az44+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el44 = (el44+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph44=(Spherical(mag4/scale,(az44.degrad+angle.degrad).wrap(pi.neg,pi),(el44.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));

	 mag_y=((Complex(cos((sph4.theta.round(0.000000000001)*m_x).wrap(pi.neg,pi)),cos((sph4.theta.round(0.000000000001)*m_x).wrap(pi.neg,pi))).rho/(2.sqrt)).pow(spread)*
			(Complex(cos((sph4.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2))),cos((sph4.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2)))).rho/(2.sqrt)).pow(spread));
	sphy=(Spherical(mag_y,sph4.theta,sph4.phi).asCartesian.round(0.000000000001)-Spherical(mag_y/scale,sph44.theta,sph44.phi).asCartesian.round(0.000000000001)).asSpherical.rho;
			};~magy=~magy++magnitudey;};


5.do{
			az5 = (az5+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el5 = (el5+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
	sph5=(Spherical(mag5,(az5.degrad+angle.degrad).wrap(pi.neg,pi),(el5.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az55=az5;el55=el5;

	qx=8.collect{
				az55=az5;el55=el5;
				az55 = (az55+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el55 = (el55+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph55=(Spherical(mag5/scale,(az55.degrad+angle.degrad).wrap(pi.neg,pi),(el55.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));

		mag_qx=((((Complex(cos(((sph5.theta.round(0.000000000001))*mq).wrap(pi.neg,pi)),cos(((sph5.theta.round(0.000000000001))*mq).wrap(pi.neg,pi))))*
			(Complex(sin((sph5.phi.round(0.000000000001)*(mq-1)).wrap((pi/2).neg,(pi/2))),sin((sph5.phi.round(0.000000000001)*(mq-1)).wrap((pi/2).neg,(pi/2)))))*
			(Complex(cos((sph5.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2))),cos((sph5.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2))))))).rho/(2.sqrt)).pow(spread);
		sphqx=(Spherical(mag_qx,sph5.theta,sph5.phi).asCartesian.round(0.000000000001)-Spherical(mag_qx/scale,sph55.theta,sph55.phi).asCartesian.round(0.000000000001)).asSpherical.rho;
			};~qx=~qx++qx;};



5.do{
			az6 = (az6+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el6 = (el6+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
	sph6=(Spherical(mag6,(az6.degrad+angle.degrad).wrap(pi.neg,pi),(el6.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az66=az6;el66=el6;

		qy=8.collect{
				az66=az4;el66=el6;
				az66 = (az66+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el66 = (el66+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph66=(Spherical(mag6/scale,(az66.degrad+angle.degrad).wrap(pi.neg,pi),(el66.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));

		mag_qy=((((Complex(sin(((sph6.theta.round(0.000000000001))*mq).wrap(pi.neg,pi)),sin(((sph6.theta.round(0.000000000001))*mq).wrap(pi.neg,pi))))*
				(Complex(sin((sph6.phi.round(0.000000000001)*(mq-1)).wrap((pi/2).neg,(pi/2))),sin((sph6.phi.round(0.000000000001)*(mq-1)).wrap((pi/2).neg,(pi/2)))))*
				(Complex(cos((sph6.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2))),cos((sph6.phi.round(0.000000000001)).wrap((pi/2).neg,(pi/2))))))).rho/(2.sqrt)).pow(spread);
		sphqy=(Spherical(mag_qy,sph6.theta,sph6.phi).asCartesian.round(0.000000000001)-Spherical(mag_qy/scale,sph66.theta,sph66.phi).asCartesian.round(0.000000000001)).asSpherical.rho;
			};~qy=~qy++qy;};


5.do{
			az7 = (az7+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el7 = (el7+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
sph7=(Spherical(mag7,(az7.degrad+angle.degrad).wrap(pi.neg,pi),(el7.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));
az77=az7;el77=el7;

	magnitudez=	8.collect{
				az77=az7;el77=el7;
				az7 = (az77+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
				el7 = (el77+((90*2.pow(n/12))-((90*2.pow(n/12))/1.6180339887499))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
				sph77=(Spherical(mag7/scale,(az77.degrad+angle.degrad).wrap(pi.neg,pi),(el77.degrad+angle.degrad).wrap((pi/2).neg,(pi/2))));

		mag_z=(Complex(cos((sph7.phi.round(0.000000000001)*m_z).wrap((pi/2).neg,(pi/2))),cos((sph7.phi.round(0.000000000001)*m_z).wrap((pi/2).neg,(pi/2)))).rho/(2.sqrt)).pow(spread);
		sphz=(Spherical(mag_z,sph7.theta,sph7.phi).asCartesian.round(0.000000000001)-Spherical(mag_z/scale,sph77.theta,sph77.phi).asCartesian.round(0.000000000001)).asSpherical.rho;
			};~magz=~magz++magnitudez;};

angle=(angle+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap(0,(180*2.pow(n/12)));
		az1=0;el1=0;az2=0;el2=0;az3=0;el3=0;
		az4=0;el4=0;az5=0;el5=0;az6=0;el6=0;az7=0;el7=0;
	}
}.value;
)