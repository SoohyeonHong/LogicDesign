# Lab 09
	## 실습 내용
	### ** 9 – FPGA의 리모컨을 이용하는 실습 **
	#### **Submodule 1**
	: ir_rx
	Sequential Rx Bits를 받아오는 모듈
	#### **Submodule 2**
	: 0~59 의 값을 갖는 6bit 입력 신호를 받아 십의 자리 수와 일의 자리 수를 각각 4bit 으로 출력
	#### **Submodule 2**
	: 
#### **Top Module**
: 저번 시간에 만든 second counter  및 Submodule 1/2 를 이용하여  실습 장비의 LED 에 맞는 Display Module 설계
### FPGA 실습 ( 팀 )
: 6 개의 LED 중  가장 오른쪽 2 개의 LED 에 1 초간격으로 0~59 까지 증가하는 Counter 값 Display
: NCO(Numerical Controlled Oscillator) 입력 바꿔서 4 초 간격으로 증가하는 코드 테스트
## 퀴즈
### 아래 코드 일부를 수정하여 다음을 구하시오
```verilog
wire  [41:0]  six_digit_seg;
assign        six_digit_seg = { 4{7'b0000000}, seg_left, seg_right }
```
> Q1 - 고정 LED ( 왼쪽 4 개 ) AAAA 출력
: `AA_AA_00`, `AA_AA_01`, `AA_AA_02`, … 순으로 LED 변경
```
wire  [41:0]  six_digit_seg;
assign        six_digit_seg = { 4{7'b1110111}, seg_left, seg_right } ;
```

> Q2 - 고정 LED 없이 2 개의 LED 단위로 1 초 Counter 값 표시
: `00_00_00`, `01_01_01`, `02_02_02`, … 순으로 LED 변경
```
wire  [41:0]  six_digit_seg;
assign        six_digit_seg = { seg_left, seg_right, seg_left, seg_right, seg_left, seg_right } ;
```

## 결과
### **Top Module 의 DUT/TestBench Code 및 Waveform 검증 **
![](https://github.com/SoohyeonHong/LogicDesign/blob/master/pr06/figs/wave.png)
### **FPGA 동작 사진 (3 개 - 일반 , Q1, Q2)**
`일반`
![](https://github.com/SoohyeonHong/LogicDesign/blob/master/pr06/figs/%EC%9D%BC%EB%B0%98.jpg)
`Q1`
![](https://github.com/SoohyeonHong/LogicDesign/blob/master/pr06/figs/AAAA01.jpg)
`Q2`
![](https://github.com/SoohyeonHong/LogicDesign/blob/master/pr06/figs/010101.jpg)

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk4MzY4NzkwMywxOTczMzkwMzQxXX0=
-->