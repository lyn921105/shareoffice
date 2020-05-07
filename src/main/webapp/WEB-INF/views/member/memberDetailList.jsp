<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="tabContent" style="display: none;">
                            <!-- searchArea : s -->
                            <div class="searchArea">
                                <dl class="formList">
                                    <dt class="blind"> 조회기간</dt>
                                    <dd>
                                        <!-- inpCal : s -->
                                        <div class="inpCal">
                                            <input type="text" class="inpText hasDatepicker" id="fromDate1" title="조회기간 첫날 입력" value="2020.04.01" readonly=""><button type="button" class="ui-datepicker-trigger">Select date</button>
                                            <a class="btnCal" aria-hidden="true" style="cursor: pointer;">달력</a>
                                        </div>
                                        <!-- inpCal : e -->
                                        <em class="blank">~</em>
                                        <!-- inpCal : s -->
                                        <div class="inpCal">
                                            <input type="text" class="inpText hasDatepicker" id="toDate1" title="조회기간 마지막날 입력" value="2020.06.30" readonly=""><button type="button" class="ui-datepicker-trigger">Select date</button>
                                            <a class="btnCal" aria-hidden="true" style="cursor: pointer;">달력</a>
                                        </div>
                                        <!-- inpCal : e -->
                                    </dd>
                                </dl>
                            </div>
                            <!-- searchArea : e -->
                            <!-- tblDate : s -->
                            <div class="tblDate space20">
                                <table>
                                    <caption>구매내역의 번호, 구매일, 분류, 상품명, 수량, 결제금액, 상태의 항목으로 구성된 표 </caption>
                                    <colgroup>
                                        <col style="width:70px">
                                        <col style="width:100px">
                                        <col style="width:100px">
                                        <col style="width:auto">
                                        <col style="width:60px">
                                        <col style="width:110px">
                                        <col style="width:100px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">번호<br>No.</th>
                                            <th scope="col">구매일<br>Date</th>
                                            <th scope="col">분류<br>Type</th>
                                            <th scope="col">상품명<br>Details</th>
                                            <th scope="col">수량<br>Quantity</th>
                                            <th scope="col">결제금액<br>Fee</th>
                                            <th scope="col">상태<br>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody id="buyInfoTBody">
                                        
                                                <tr>
                                                    <td colspan="7">해당 카테고리에 대한 내용이 없습니다.<br>There are no results that match your search</td>
                                                </tr>
                                            
                                        
                                    </tbody>
                                </table>
                            </div>

</body>
</html>