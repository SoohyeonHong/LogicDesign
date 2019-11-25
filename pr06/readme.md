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
FPGA에 있는 숫자를 표현하는 o_seg_(a~g)까지의 7-segment에 4bit 숫자를 입력했을 때 해당하는 숫자나 문자가 어느 seg를 on/off 할 것인지를 표현한 것이다. 그 4bit짜리 입력을 i_num으로 입력값을 받아 출력한다. o_seg는 7개의 segment를 가지므로 7개의 벡터값을 가진 7bit로 표현하였다.

위에서부터 4'd0~4d'9는 숫자 0에서 9까지를 표현하며, 10부터는 각각 A,b,C,d,E,F를 표현한다.
### **2. ir_rx**
```
//	--------------------------------------------------
//	IR Rx Module: Note : Inverted IR Rx Signal
//	--------------------------------------------------
module	ir_rx(	
		o_data,
		i_ir_rxb,
		clk,
		rst_n);

output	[31:0]	o_data		;

input		i_ir_rxb	;
input		clk		;
input		rst_n		;

parameter	IDLE		= 2'b00	;
parameter	LEADCODE	= 2'b01	;	// 9ms high 4.5ms low
parameter	DATACODE	= 2'b10	;	// Custom & Data Code
parameter	COMPLETE	= 2'b11	;	// 32-bit data

//		1M Clock = 1 us Reference Time
wire		clk_1M				;
nco		u_nco(
		.o_gen_clk	( clk_1M	),
		.i_nco_num	( 32'd50	),
		.clk		( clk		),
		.rst_n		( rst_n		));

//		Sequential Rx Bits

wire		ir_rx		;
assign		ir_rx = ~i_ir_rxb;

reg	[1:0]	seq_rx				;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		seq_rx <= 2'b00;
	end else begin
		seq_rx <= {seq_rx[0], ir_rx};
	end
end

//		Count Signal Polarity (High & Low)
reg	[15:0]	cnt_h		;
reg	[15:0]	cnt_l		;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		cnt_h <= 16'd0;
		cnt_l <= 16'd0;
	end else begin
		case(seq_rx)
			2'b00	: cnt_l <= cnt_l + 1;
			2'b01	: begin
				cnt_l <= 16'd0;
				cnt_h <= 16'd0;
			end
			2'b11	: cnt_h <= cnt_h + 1;
		endcase
	end
end

//		State Machine
reg	[1:0]	state		;
reg	[5:0]	cnt32		;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		state <= IDLE;
		cnt32 <= 6'd0;
	end else begin
		case (state)
			IDLE: begin
				state <= LEADCODE;
				cnt32 <= 6'd0;
			end
			LEADCODE: begin
				if (cnt_h >= 8500 && cnt_l >= 4000) begin
					state <= DATACODE;
				end else begin
					state <= LEADCODE;
				end
			end
			DATACODE: begin
				if (seq_rx == 2'b01) begin
					cnt32 <= cnt32 + 1;
				end else begin
					cnt32 <= cnt32;
				end
				if (cnt32 >= 6'd32 && cnt_l >= 1000) begin
					state <= COMPLETE;
				end else begin
					state <= DATACODE;
				end
			end
			COMPLETE: state <= IDLE;
		endcase
	end
end

//		32bit Custom & Data Code
reg	[31:0]	data		;
reg	[31:0]	o_data		;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		data <= 32'd0;
	end else begin
		case (state)
			DATACODE: begin
				if (cnt_l >= 1000) begin
					data[32-cnt32] <= 1'b1;
				end else begin
					data[32-cnt32] <= 1'b0;
				end
			end
			COMPLETE: o_data <= data;
		endcase
	end
end


endmodule
```
적외선(Infrared Rays, IR) 컨트롤러, 즉 리모컨을 IR Controller라고 하는데, 이는 적외선 발광 다이오드로 발생시킬 수 있다. 우리는 리모컨에서 발생시킨 적외선을 받아와 신호로 입력시켜야 하는데, 송신부 코드를 짜는 것이므로 이를 일반적으로 rx라고 한다. 
이에는 NEC 적외선  통신 규약이 적용되는데, 32비트 짜리 신호가 송신된다는 것이다. 이는 Leader Code와 Custom Code, Data Code를 가지고 있는데 우리는 이 중에서 필요없는 앞 코드는 버리고 뒷 콛

## **Top Module**
: 저번 시간에 만든 second counter  및 Submodule 1/2 를 이용하여  실습 장비의 LED 에 맞는 Display Module 설계
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTQ2Nzc2NTAsMTgzOTc5NDI4OCwtMTAzMD
c2OTU5MiwxOTczMzkwMzQxXX0=
-->