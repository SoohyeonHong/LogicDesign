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
## **모듈별 상세 설명** 
### **>> Top Module**




## **Top Module**
: 저번 시간에 만든 second counter  및 Submodule 1/2 를 이용하여  실습 장비의 LED 에 맞는 Display Module 설계
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUxNjMwNDY3LDE4Mzk3OTQyODgsLTEwMz
A3Njk1OTIsMTk3MzM5MDM0MV19
-->