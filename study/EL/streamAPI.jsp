<%@ page contentType="text/html; charset=UTF-8"%>
<h2>stream API</h2>
${ lst = [1,2,3,4,5] ;"lst = [1,2,3,4,5] 선언"}<br>
lst 내 원소 합 sum = ${ lst.stream().sum() }<br>
lst 내 원소 평균 avg = ${ lst.stream().average().orElse('중간값구할수없음') }<br>
lst 내 원소 최댓값 max = ${ lst.stream().max().orElse('최대값구할수없음') }<br>
lst 내 원소 최솟값 min = ${ lst.stream().min().orElse('최솟값구할수없음') }<br>
<hr>
lst 내 원소 중 짝수 = ${ lst.stream().filter(x -> x%2 == 0).toList() }<br>
lst 내 원소 중 홀수 = ${ lst.stream().filter(x -> x%2 != 0).toList() }<br>
<hr>
lst 내 원소 중 1보다 작은숫자(Match이용 x) = ${ lst.stream().filter(x -> x<1).average().orElse('1보다 작은 숫자 없음')}<br>
lst 내 원소 중 5보다 큰 숫자(Match이용 x) = ${ lst.stream().filter(x -> x>5).average().orElse('5보다 큰 숫자 없음')}<br>
lst 내 원소 각각 제곱형태로 변환하기 = ${ lst.stream().map(x -> x * x).toList()}
<hr>
<h3>allMatch, anyMatch, noneMatch이용 탐색</h3>
lst 내 원소들이 모두 0보다 큰지?(allMatch) = ${ lst.stream().allMatch(x -> x > 0).orElse('0보다 작은 숫자 있음') }<br>
lst 내 원소들 중 5보다 큰수가 있는지?(anyMatch) = ${ lst.stream().anyMatch(x -> x > 5).orElse('5보다 큰 수 없음')}<br>
lst 내 원소 중 5보다 큰수가 없는지?(noneMatch) = ${ lst.stream().noneMatch(x -> x > 5).orElse('5보다 큰 수 있음')}<br>
