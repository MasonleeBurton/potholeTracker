<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />
<div class="map-container">
<div id="map-canvas"></div>
</div>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANsplbu_wQ2HF2Fp29fD_X0LA_xczXkgc"></script>

<c:url var="potholeMapJs" value="/js/potholeMap.js" />
<script>window.potholes = ${potholes}</script>
<script src="${potholeMapJs}"></script>

<c:import url="/WEB-INF/jsp/footer.jsp" />