<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<title>Monty Hall</title>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ page isELIgnored="false" %>
	</head>
	
	<body>
		<h1 class="firstHeading" id="firstHeading" lang="en" style="text-align: center;">
			Monty Hall</h1>
		<table align="center" border="1" cellpadding="1" cellspacing="0" style="width: 500px;">
			<tbody>
				<tr>
					<td style="text-align: center;">
						<strong>Box 1</strong></td>
					<td style="text-align: center;">
						<strong>Box 2</strong></td>
					<td style="text-align: center;">
						<strong>Box 3</strong></td>
				</tr>
				<tr>
				
				<c:choose>
				    <c:when test="${gameSession.round == 0}">
				    	<c:forEach var="item" items="${gameSession.boxes}">
							<td style="text-align: center;">
						    	<a href="?boxNumber=${item.boxNumber}&round=1">
									<img alt="closed box" src="img/closed_box.jpg" />
								</a> 
							</td>
						</c:forEach>
				    </c:when>
				    
				    <c:when test="${gameSession.round == 1}">
				        <c:forEach var="item" items="${gameSession.boxes}">
							<td style="text-align: center;">
						    	<c:choose>
								    <c:when test="${item.selected == true}">
								    	<a href="?boxNumber=${item.boxNumber}&round=2">
											<img alt="closed box" src="img/closed_box.jpg" />
											Your Box!
										</a> 
								    </c:when>
								    <c:when test="${item.emptyAndOpened == true}">
										<img alt="empty box" src="img/empty_box.jpg" />
								    </c:when>
								    <c:otherwise>
								        <a href="?boxNumber=${item.boxNumber}&round=2">
											<img alt="closed box" src="img/closed_box.jpg" />
										</a> 
								    </c:otherwise>
								</c:choose>
							</td>
						</c:forEach>
				    </c:when>
				    
				    <c:when test="${gameSession.round == 2}">
				        <c:forEach var="item" items="${gameSession.boxes}">
							<td style="text-align: center;">
						    	<c:choose>
								    <c:when test="${item.boxValue == 'MONEY'}">
										<img alt="money box" src="img/money_box.jpg" />
								    </c:when>
								    <c:otherwise>
										<img alt="empty box" src="img/empty_box.jpg" />
								    </c:otherwise>
								</c:choose>
							</td>
						</c:forEach>
				    </c:when>
				    
				</c:choose>
				
				</tr>
			</tbody>
		</table>
		
		<table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;">
			<tbody>
				<tr>
					<td style="text-align: center;">
						<p>
							<c:if test="${result eq 'success' and gameSession.round == 2}">
								<span style="color:#00ff00;">
									<strong>Congratulations! You win:) <a href="?round=0">Again?</a>
									</strong>
								</span>
							</c:if>
							<c:if test="${result ne 'success' and gameSession.round == 2}">
								<span style="color:#ff8c00;">
									<strong>Sorry! You Loose!:( <a href="?round=0">Again?</a>
									</strong>
								</span>
							</c:if>
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		
		<table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 500px;">
			<tbody>
				<tr>
					<td>
						<p>
							How to play:</p>
						<p>
							1- Select any box.</p>
						<p>
							2- Select the other box if you want to switch, otherwise select yours again.</p>
					</td>
				</tr>
			</tbody>
		</table>
		
	</body>
</html>
