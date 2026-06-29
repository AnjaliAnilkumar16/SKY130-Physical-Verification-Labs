v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 3750 -740 3840 -740 { lab=in}
N 3750 -680 4150 -680 { lab=GND}
N 4130 -700 4150 -700 { lab=GND}
N 3990 -680 3990 -650 { lab=GND}
N 4150 -700 4150 -680 { lab=GND}
N 4130 -740 4260 -740 { lab=#net1}
N 4150 -680 4260 -680 { lab=GND}
N 4130 -720 4170 -720 { lab=out}
N 3800 -810 3830 -810 { lab=in}
N 3800 -810 3800 -740 { lab=in}
C {inverter.sym} 3980 -720 0 0 {name=x1}
C {devices/vsource.sym} 3750 -710 0 0 {name=V1 value="PWL(0 0 20n 0 900n 1.8)"}
C {devices/vsource.sym} 4260 -710 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} 3990 -650 0 0 {name=l1 lab=GND}
C {devices/opin.sym} 4160 -720 0 0 {name=p2 lab=out}
C {devices/opin.sym} 3820 -810 0 0 {name=p1 lab=in}
C {devices/code_shown.sym} 4190 -830 0 0 {name=s1 only_toplevel=false value=".lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"}
C {devices/code_shown.sym} 4170 -630 0 0 {name=s2 only_toplevel=false value=".control
tran 1n 1u
plot v(in) v(out)
.endc"}
