onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/reset
add wave -noupdate -radix hexadecimal /tb/padrao
add wave -noupdate -divider {fluxo IN e OUT}
add wave -noupdate /tb/DUT/din
add wave -noupdate /tb/DUT/dout
add wave -noupdate -radix hexadecimal /tb/DUT/regDin
add wave -noupdate -divider PROGRAMACAO
add wave -noupdate -radix unsigned /tb/DUT/prog
add wave -noupdate -divider PADROES
add wave -noupdate /tb/DUT/valid
add wave -noupdate -radix hexadecimal /tb/DUT/regPat
add wave -noupdate -divider ALARME
add wave -noupdate /tb/DUT/alarm
add wave -noupdate -radix unsigned /tb/DUT/cont
add wave -noupdate -divider {sinais internos}
add wave -noupdate /tb/DUT/st
add wave -noupdate /tb/DUT/match
add wave -noupdate -divider {test bench}
add wave -noupdate -radix unsigned /tb/conta_tempo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {286 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 110
configure wave -valuecolwidth 50
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 2000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {600 ns}
