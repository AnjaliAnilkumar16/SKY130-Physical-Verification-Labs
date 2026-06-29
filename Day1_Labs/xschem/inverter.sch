v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 3700 -790 3700 -670 { lab=out}
N 3700 -740 3930 -740 { lab=out}
N 3660 -820 3660 -640 { lab=in}
N 3540 -740 3660 -740 { lab=in}
N 3700 -610 3700 -500 { lab=vss}
N 3700 -640 3730 -640 { lab=vss}
N 3700 -500 3790 -500 { lab=vss}
N 3730 -640 3790 -640 { lab=vss}
N 3790 -640 3790 -500 { lab=vss}
N 3700 -910 3700 -840 { lab=#net1}
C {sky130_fd_pr/pfet3_01v8.sym} 3680 -820 0 0 {name=M1
L=0.18
W=3
body=VDDDD
nf=3
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 3680 -640 0 0 {name=M2
L=0.18
W=4.5
nf=3 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 3550 -740 0 0 {name=p1 lab=in
}
C {devices/iopin.sym} 3690 -910 0 0 {name=p3 lab=vdd}
C {devices/iopin.sym} 3780 -500 0 0 {name=p4 lab=vss}
C {devices/opin.sym} 3930 -740 0 0 {name=p6 lab=out}
