<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url value="/updateRole" var="updateRoleURL" />
<h2 class="my-3 text-center">Admin</h2>

<h4>Update User Role</h4>
<div class="adminForm">
<form action="${updateRoleURL}" method="POST">

	<label for="userName">User Name:</label>
	<input type="text" name="userName" />

	<select name="role">
		<option value="user">User</option>
		<option value="employee">Employee</option>
	</select>
	
	<input type="submit" value="Submit">

</form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />