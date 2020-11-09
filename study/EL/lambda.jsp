<%@ page contentType="text/html; charset=UTF-8"%>
<h2>람다식 사용법</h2>
${lambda = (a,b) -> a > b ? true:false ; "람다식 지정 완료"}<p>

lambda(1,3)결과: ${lambda(1,3)}<p>
lambda(3,1)결과: ${lambda(3,1)}<p>
<hr>
<h2>팩토리얼</h2>
${Pactorial = n -> n == 1 ? 1 : n * Pactorial(n-1) ; "팩토리얼 지정 완료"}<p>
5팩토리얼 = ${Pactorial(5)}<br>
10팩토리얼 = ${Pactorial(10)}<br>
20팩토리얼 = ${Pactorial(20)}