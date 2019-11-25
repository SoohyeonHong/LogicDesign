# Lab 09
	## 실습 내용
	### ** 9 – FPGA의 리모컨을 이용하는 실습 **
	<요약>
	#### **Submodule 1**
	: ir_rx
	Sequential Rx Bits를 받아오는 모듈
	#### **Submodule 2**
	: fnd_dec
	FPGA의 7-segment로 각 해당하는 숫자와 문자를 bit로 표현
	#### **Submodule 2**
	: led_disp
	fnd_dec으로부터 bit를 받아 led로 숫자나 문자를 띄움
## **<모듈별 상세 설명>** 
### **1. fnd dec**
```
//	--------------------------------------------------
//	Flexible Numerical Display Decoder
//	--------------------------------------------------
module	fnd_dec(
		o_seg,
		i_num);

output	[6:0]	o_seg		;	// {o_seg_a, o_seg_b, ... , o_seg_g}

input	[3:0]	i_num		;
reg		[6:0]	o_seg		;
//making
always @(i_num) begin 
 	case(i_num) 
 		4'd0:	o_seg = 7'b111_1110; 
 		4'd1:	o_seg = 7'b011_0000; 
 		4'd2:	o_seg = 7'b110_1101; 
 		4'd3:	o_seg = 7'b111_1001; 
 		4'd4:	o_seg = 7'b011_0011; 
 		4'd5:	o_seg = 7'b101_1011; 
 		4'd6:	o_seg = 7'b101_1111; 
 		4'd7:	o_seg = 7'b111_0000; 
 		4'd8:	o_seg = 7'b111_1111; 
 		4'd9:	o_seg = 7'b111_0011; 
 		4'd10:	o_seg = 7'b111_0111; 
 		4'd11:	o_seg = 7'b001_1111; 
 		4'd12:	o_seg = 7'b100_1110; 
 		4'd13:	o_seg = 7'b011_1101; 
 		4'd14:	o_seg = 7'b100_1111; 
 		4'd15:	o_seg = 7'b100_0111; 
		default:o_seg = 7'b000_0000; 
	endcase 
end

endmodule
```
FPGA에 있는 숫자를 표현하는 o_seg_(a~g)까지의 7-segment에 4bit 숫자를 입력했을 때 해당하는 숫자나 문자가 어느 seg를 on/off 할 것인지를 표현한 것이다.

위에서부터 4'd0~4d'9는 숫자 0에서 9까지를 표현하며, 10부터는 각각 A,b,C,d,E,F를 표현한다.
## **Top Module**
: 저번 시간에 만든 second counter  및 Submodule 1/2 를 이용하여  실습 장비의 LED 에 맞는 Display Module 설계
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwNjA4NjQzNSwxODM5Nzk0Mjg4LC0xMD
MwNzY5NTkyLDE5NzMzOTAzNDFdfQ==
-->